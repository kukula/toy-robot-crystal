module ToyRobot
  module Command
    abstract class Base
      property robot : Robot

      def initialize(@robot : Robot)
      end
    end
  end
end
