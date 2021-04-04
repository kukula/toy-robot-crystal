require "../../spec_helper"

describe ToyRobot::Command::Report do
  describe "#execute" do
    it "outputs report of robots current position" do
      robot = ToyRobot::Robot.new(4, 2, ToyRobot::Robot::Direction::WEST)

      output = Stdio.capture do |io|
        ToyRobot::Command::Report
          .new(robot, ToyRobot::Table.new, STDOUT)
          .execute

        io.out.gets
      end

      output.should eq("4,2,WEST")
    end

    it "returns nil when robot is not placed" do
      robot = ToyRobot::Robot.new

      expect_raises(ToyRobot::NotPlaced) do
        ToyRobot::Command::Report
          .new(robot, ToyRobot::Table.new, STDOUT)
          .execute
      end
    end
  end
end
