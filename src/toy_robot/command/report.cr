module ToyRobot
  module Command
    class Report < Base
      def execute : String?
        raise NotPlaced.new("You need to place robot before requesting a report") unless robot.placed?

        [robot.x, robot.y, robot.direction].join(",")
      end
    end
  end
end
