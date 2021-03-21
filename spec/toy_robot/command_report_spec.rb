require "../spec_helper"

describe ToyRobot::Command::Report do
  describe "#execute" do
    it "returns report of robots current position" do
      robot = ToyRobot::Robot.new
      robot.x = ToyRobot::Table::DEFAULT_WIDTH
      robot.y = ToyRobot::Table::DEFAULT_HEIGHT
      robot.direction = ToyRobot::Robot::Direction::North

      ToyRobot::Command::Report.new(robot).execute.should eq("5,5,NORTH")
    end

    it "returns nil when robot is not placed" do
      robot = ToyRobot::Robot.new

      ToyRobot::Command::Report.new(robot).execute.should eq(nil)
    end
  end
end
