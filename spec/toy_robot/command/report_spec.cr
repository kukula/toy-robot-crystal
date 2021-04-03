require "../../spec_helper"

describe ToyRobot::Command::Report do
  describe "#execute" do
    it "returns report of robots current position" do
      robot = ToyRobot::Robot.new(ToyRobot::Table::DEFAULT_WIDTH,
        ToyRobot::Table::DEFAULT_HEIGHT,
        ToyRobot::Robot::Direction::NORTH)

      ToyRobot::Command::Report.new(robot).execute.should eq("5,5,NORTH")
    end

    it "returns nil when robot is not placed" do
      robot = ToyRobot::Robot.new

      expect_raises(ToyRobot::NotPlaced) do
        ToyRobot::Command::Report.new(robot).execute
      end
    end
  end
end
