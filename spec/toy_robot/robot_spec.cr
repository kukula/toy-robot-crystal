require "../spec_helper"

describe ToyRobot::Robot do
  describe "#placed?" do
    it "returns false when initialized" do
      ToyRobot::Robot.new.placed?.should eq(false)
    end

    it "returns true when has x, y and direction" do
      robot = ToyRobot::Robot.new(0, 0, ToyRobot::Robot::Direction::NORTH)

      robot.placed?.should eq(true)
    end
  end
end
