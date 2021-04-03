require "../../spec_helper"

describe ToyRobot::Command::Move do
  describe "#execute" do
    it "moves robot one unit forward in the north direction" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new(0, 0, ToyRobot::Robot::Direction::NORTH)
      ToyRobot::Command::Move.new(robot, table).execute

      robot.x.should eq(0)
      robot.y.should eq(1)
    end

    it "raises an exception when robot is on the north edge" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new(0,
        ToyRobot::Table::DEFAULT_HEIGHT,
        ToyRobot::Robot::Direction::NORTH)

      expect_raises(ToyRobot::OutsideOfTable) do
        ToyRobot::Command::Move.new(robot, table).execute
      end
    end

    it "moves robot one unit forward in the south direction" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new(0,
        ToyRobot::Table::DEFAULT_HEIGHT,
        ToyRobot::Robot::Direction::SOUTH)

      ToyRobot::Command::Move.new(robot, table).execute

      robot.x.should eq(0)
      robot.y.should eq(ToyRobot::Table::DEFAULT_HEIGHT - 1)
    end

    it "raises an exception when robot is on the south edge" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new(0, 0, ToyRobot::Robot::Direction::SOUTH)

      expect_raises(ToyRobot::OutsideOfTable) do
        ToyRobot::Command::Move.new(robot, table).execute
      end
    end

    it "moves robot one unit forward in the west direction" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new(ToyRobot::Table::DEFAULT_WIDTH,
        0,
        ToyRobot::Robot::Direction::WEST)

      ToyRobot::Command::Move.new(robot, table).execute
      robot.x.should eq(ToyRobot::Table::DEFAULT_WIDTH - 1)
      robot.y.should eq(0)
    end

    it "raises an exception when robot is on the west edge" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new(0, 0, ToyRobot::Robot::Direction::WEST)

      expect_raises(ToyRobot::OutsideOfTable) do
        ToyRobot::Command::Move.new(robot, table).execute
      end
    end

    it "moves robot one unit forward in the east direction" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new(0, 0, ToyRobot::Robot::Direction::EAST)

      ToyRobot::Command::Move.new(robot, table).execute
      robot.x.should eq(1)
      robot.y.should eq(0)
    end

    it "raises an exception when robot is on the east edge" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new(ToyRobot::Table::DEFAULT_WIDTH,
        0,
        ToyRobot::Robot::Direction::EAST)

      expect_raises(ToyRobot::OutsideOfTable) do
        ToyRobot::Command::Move.new(robot, table).execute
      end
    end

    it "raises an exception when robot is not placed" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new

      expect_raises(ToyRobot::NotPlaced) do
        ToyRobot::Command::Move.new(robot, table).execute
      end
    end
  end
end
