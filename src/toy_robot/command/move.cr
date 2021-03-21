module ToyRobot
  module Command
    class Move < Base
      DIRECTIONS = {
        NORTH: {0, 1},
        SOUTH: {0, -1},
        EAST:  {1, 0},
        WEST:  {-1, 0},
      }

      property robot : Robot
      property table : Table

      def initialize(@robot : Robot, @table : Table)
      end

      def execute : Robot
        raise NotPlaced.new("You need to place robot before making a move") unless robot.placed?

        robot.x = robot.x.as(Int32) + movement_x
        robot.y = robot.y.as(Int32) + movement_y

        raise OutsideOfTable.new("You can't move outside of the table") unless table.fits?(robot)

        robot
      end

      private def movement : Tuple(Int32, Int32)
        DIRECTIONS[robot.direction.to_s]
      end

      private def movement_x : Int32
        raise WrongDirection.new("Can't find direction to move") unless movement

        movement[0].as(Int32)
      end

      private def movement_y : Int32
        raise WrongDirection.new("Can't find direction to move") unless movement

        movement[1].as(Int32)
      end
    end
  end
end
