module ToyRobot
  module Command
    class Move < Base
      DIRECTIONS = {
        NORTH: {0, 1},
        SOUTH: {0, -1},
        EAST:  {1, 0},
        WEST:  {-1, 0},
      }

      def execute
        raise NotPlaced.new("You need to place robot before making a move") unless robot.placed?
        raise OutsideOfTable.new("You can't move outside of the table") unless table.fits?(new_x, new_y)

        robot.x = new_x
        robot.y = new_y
      end

      private def movement : Tuple(Int32, Int32)?
        result = DIRECTIONS[robot.direction.to_s]
        raise WrongDirection.new("Can't find direction to move") unless result
        result
      end

      private def movement_x : Int32
        movement[0].as(Int32)
      end

      private def movement_y : Int32
        movement[1].as(Int32)
      end

      private def new_x : Int32
        robot.x.as(Int32) + movement_x
      end

      private def new_y : Int32
        robot.y.as(Int32) + movement_y
      end
    end
  end
end
