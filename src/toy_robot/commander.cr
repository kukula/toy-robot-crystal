require "./command/*"

module ToyRobot
  class Commander
    property robot : Robot
    getter table : Table

    def initialize(@robot = Robot.new, @table = Table.new)
    end

    def parse(input : String) : Command::Base?
      case input
      when /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/i
        _command, x, y, direction = input.gsub(",", " ").split
        Command::Place
          .new(robot, table, x.to_i, y.to_i, Robot::Direction.parse(direction))
      when /^MOVE$/i
        Command::Move.new(robot, table)
      when /^LEFT$/i
        Command::Rotate.new(robot, Command::Rotate::Direction::LEFT)
      when /^RIGHT$/i
        Command::Rotate.new(robot, Command::Rotate::Direction::RIGHT)
      when /^REPORT$/i
        Command::Report.new(robot)
      else
        raise UnrecognisedCommand.new("Unrecognised command, please RTM")
      end
    end

    def execute(input : String) : String?
      command = parse(input)
      return unless command

      case output = command.execute
      when Robot
        self.robot = output
        return
      else
        output
      end
    rescue ex : UnrecognisedCommand | NotPlaced | OutsideOfTable | WrongDirection
      STDERR.puts "Ignored error for input '#{input}': #{ex.message}"
      nil
    end
  end
end
