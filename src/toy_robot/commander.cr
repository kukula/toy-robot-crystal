require "./command/*"

module ToyRobot
  class Commander
    getter output : IO::FileDescriptor
    getter error_output : IO::FileDescriptor
    property robot : Robot
    getter table : Table

    def initialize(@output = STDOUT,
                   @error_output = STDERR,
                   @robot = Robot.new,
                   @table = Table.new)
    end

    def parse(input : String) : Command::Base?
      case input
      when /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/i
        _command, x, y, direction = input.gsub(",", " ").split
        Command::Place
          .new(
            robot,
            table,
            x.to_i,
            y.to_i,
            Robot::Direction.parse(direction))
      when /^MOVE$/i
        Command::Move.new(robot, table)
      when /^LEFT$/i
        Command::Rotate.new(robot, Command::Rotate::Direction::LEFT)
      when /^RIGHT$/i
        Command::Rotate.new(robot, Command::Rotate::Direction::RIGHT)
      when /^REPORT$/i
        Command::Report.new(robot, output)
      else
        raise UnrecognisedCommand.new("Unrecognised command, please RTM")
      end
    end

    def execute(input : String)
      command = parse(input)
      return unless command
      command.execute
    rescue ex : UnrecognisedCommand | NotPlaced | OutsideOfTable | WrongDirection
      error_output.puts "Ignored error for input '#{input}': #{ex.message}"
    end
  end
end
