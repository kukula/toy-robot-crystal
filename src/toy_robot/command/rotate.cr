module ToyRobot
  module Command
    class Rotate < Base
      enum RotateDirection
        LEFT
        RIGHT
      end

      def execute(rotate_direction : RotateDirection)
        raise NotPlaced.new("You need to place robot before making a move") unless robot.placed?

        robot.direction = Robot::Direction.new(new_direction(rotate_direction) % 4)
      end

      private def new_direction(rotate_direction : RotateDirection) : Int32
        if rotate_direction.right?
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
