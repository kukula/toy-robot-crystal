require "../spec_helper"

describe ToyRobot::Table do
  describe "#placed?" do
    it "returns false when initialized" do
      ToyRobot::Robot.new.placed?.should eq(false)
    end

    it "returns false when has x, y and direction" do
      robot = ToyRobot::Robot.new
      robot.x = 0
      robot.y = 0
      robot.direction = ToyRobot::Direction::North

      robot.placed?.should eq(true)
    end
  end
end
