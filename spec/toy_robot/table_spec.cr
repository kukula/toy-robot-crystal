require "../spec_helper"

describe ToyRobot::Table do
  it "has default width 5" do
    ToyRobot::Table.new.width.should eq(ToyRobot::Table::DEFAULT_WIDTH)
  end

  it "has default height 5" do
    ToyRobot::Table.new.height.should eq(ToyRobot::Table::DEFAULT_HEIGHT)
  end

  describe "#fits?" do
    it "returns false when robot isn't placed" do
      robot = ToyRobot::Robot.new

      ToyRobot::Table.new.fits?(robot).should eq(false)
    end

    it "returns false when robot's x coordinate isn't on the table" do
      robot = ToyRobot::Robot.new
      robot.x = ToyRobot::Table::DEFAULT_WIDTH + 1
      robot.y = ToyRobot::Table::DEFAULT_HEIGHT
      robot.direction = ToyRobot::Direction::North

      ToyRobot::Table.new.fits?(robot).should eq(false)
    end

    it "returns false when robot's y coordinate isn't on the table" do
      robot = ToyRobot::Robot.new
      robot.x = ToyRobot::Table::DEFAULT_WIDTH
      robot.y = ToyRobot::Table::DEFAULT_HEIGHT + 1
      robot.direction = ToyRobot::Direction::North

      ToyRobot::Table.new.fits?(robot).should eq(false)
    end

    it "returns true when robot's coordinates are on the table" do
      robot = ToyRobot::Robot.new
      robot.x = ToyRobot::Table::DEFAULT_WIDTH
      robot.y = ToyRobot::Table::DEFAULT_HEIGHT
      robot.direction = ToyRobot::Direction::North

      ToyRobot::Table.new.fits?(robot).should eq(true)
    end
  end
end
