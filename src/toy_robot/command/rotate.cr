module ToyRobot
  module Command
    class Rotate < Base
      enum Direction
        LEFT
        RIGHT
      end

      property robot : Robot
      property direction : Direction

      def initialize(@robot : Robot, @direction : Direction)
      end

      def execute : Robot
        raise NotPlaced.new("You need to place robot before making a move") unless robot.placed?

        robot.direction = Robot::Direction.new(new_direction % 4)

        robot
      end

      private def new_direction
        if direction.right?
          robot.direction.as(Robot::Direction).value + 1
        else
          robot.direction.as(Robot::Direction).value - 1
        end
      end
    end
  end
end
