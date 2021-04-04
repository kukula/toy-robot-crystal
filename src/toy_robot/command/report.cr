module ToyRobot
  module Command
    class Report < Base
      def execute
        raise NotPlaced.new("You need to place the robot before requesting a report") unless robot.placed?

        output.puts robot.to_s
      end
    end
  end
end
