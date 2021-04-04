require "./command/*"

module ToyRobot
  class Commander
    getter output : IO::FileDescriptor
    property robot : Robot
    getter table : Table

    def initialize(@output = STDOUT,
                   @robot = Robot.new,
                   @table = Table.new)
    end

    def execute(input : String) : Command::Base?
      case input
      when /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/i
        _command, x, y, direction = input.gsub(",", " ").split
        command = Command::Place.new(robot, table, output)
        command.execute(x.to_i, y.to_i, Robot::Direction.parse(direction))
      when /^MOVE$/i
        command = Command::Move.new(robot, table, output)
        command.execute
      when /^LEFT$/i
        command = Command::Rotate.new(robot, table, output)
        command.execute(Command::Rotate::RotateDirection::LEFT)
      when /^RIGHT$/i
        command = Command::Rotate.new(robot, table, output)
        command.execute(Command::Rotate::RotateDirection::RIGHT)
      when /^REPORT$/i
        command = Command::Report.new(robot, table, output)
        command.execute
      else
        raise UnrecognisedCommand.new("Unrecognised command, please RTM")
      end
      command
    end
  end
end
