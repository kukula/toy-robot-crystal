module ToyRobot
  module Command
    class Place < Base
      property robot : Robot
      property table : Table
      property x : Int32
      property y : Int32
      property direction : Robot::Direction

      def initialize(@robot : Robot,
                     @table : Table,
                     @x : Int32,
                     @y : Int32,
                     @direction : Robot::Direction)
      end

      def execute : Robot
        robot.x = x
        robot.y = y
        robot.direction = direction

        raise NotPlaced.new("Something went wrong") unless robot.placed?
        raise OutsideOfTable.new("Can't place robot outside of the table") unless table.fits?(robot)

        robot
      end
    end
  end
end
