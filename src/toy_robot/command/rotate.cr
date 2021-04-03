module ToyRobot
  module Command
    class Rotate < Base
      enum Direction
        LEFT
        RIGHT
      end

      property robot : Robot
      getter direction : Direction

      def initialize(@robot : Robot, @direction : Direction)
      end

      def execute
        raise NotPlaced.new("You need to place robot before making a move") unless robot.placed?

        robot.direction = Robot::Direction.new(new_direction % 4)
      end

      private def new_direction : Int32
        if direction.right?
          robot_direction + 1
        else
          robot_direction - 1
        end
      end

      private def robot_direction : Int32
        robot.direction.as(Robot::Direction).value
      end
    end
  end
end
