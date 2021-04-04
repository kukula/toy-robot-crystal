module ToyRobot
  module Command
    class Place < Base
      def execute(x : Int32,
                  y : Int32,
                  direction : Robot::Direction)
        robot.x = x
        robot.y = y
        robot.direction = direction

        raise NotPlaced.new("Something went wrong") unless robot.placed?
        raise OutsideOfTable.new("Can't place robot outside of the table") unless table.fits?(robot)
      end
    end
  end
end
