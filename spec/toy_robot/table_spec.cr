require "../spec_helper"

describe ToyRobot::Table do
  it "has default width 5" do
    ToyRobot::Table.new.width.should eq(ToyRobot::Table::DEFAULT_WIDTH)
  end

  it "has default height 5" do
    ToyRobot::Table.new.height.should eq(ToyRobot::Table::DEFAULT_HEIGHT)
  end

  describe "#fits?" do
    context "for coordinates" do
      it "returns false when x coordinate isn't on the table" do
        x = ToyRobot::Table::DEFAULT_WIDTH + 1
        y = ToyRobot::Table::DEFAULT_HEIGHT

        ToyRobot::Table.new.fits?(x, y).should eq(false)
      end

      it "returns false when y coordinate isn't on the table" do
        x = ToyRobot::Table::DEFAULT_WIDTH
        y = ToyRobot::Table::DEFAULT_HEIGHT + 1

        ToyRobot::Table.new.fits?(x, y).should eq(false)
      end

      it "returns true when coordinates are on the table" do
        x = ToyRobot::Table::DEFAULT_WIDTH
        y = ToyRobot::Table::DEFAULT_HEIGHT

        ToyRobot::Table.new.fits?(x, y).should eq(true)
      end
    end

    context "for robot" do
      it "returns false when robot isn't placed" do
        robot = ToyRobot::Robot.new

        ToyRobot::Table.new.fits?(robot).should eq(false)
      end

      it "returns false when robot's x coordinate isn't on the table" do
        robot = ToyRobot::Robot.new(
          ToyRobot::Table::DEFAULT_WIDTH + 1,
          ToyRobot::Table::DEFAULT_HEIGHT,
          ToyRobot::Robot::Direction::NORTH)

        ToyRobot::Table.new.fits?(robot).should eq(false)
      end

      it "returns false when robot's y coordinate isn't on the table" do
        robot = ToyRobot::Robot.new(
          ToyRobot::Table::DEFAULT_WIDTH,
          ToyRobot::Table::DEFAULT_HEIGHT + 1,
          ToyRobot::Robot::Direction::NORTH)

        ToyRobot::Table.new.fits?(robot).should eq(false)
      end

      it "returns true when robot's coordinates are on the table" do
        robot = ToyRobot::Robot.new(
          ToyRobot::Table::DEFAULT_WIDTH,
          ToyRobot::Table::DEFAULT_HEIGHT,
          ToyRobot::Robot::Direction::NORTH)

        ToyRobot::Table.new.fits?(robot).should eq(true)
      end
    end
  end
end
