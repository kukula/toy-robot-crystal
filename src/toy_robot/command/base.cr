module ToyRobot
  module Command
    abstract class Base
      property robot : Robot
      property table : Table
      property output : IO::FileDescriptor

      def initialize(@robot : Robot, @table : Table, @output : IO::FileDescriptor)
      end
    end
  end
end
