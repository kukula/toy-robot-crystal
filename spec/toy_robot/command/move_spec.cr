require "../../spec_helper"

describe ToyRobot::Command::Move do
  describe "#execute" do
    it "moves robot one unit forward in the north direction" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new
      robot.x = 0
      robot.y = 0
      robot.direction = ToyRobot::Robot::Direction::NORTH

      resulting_robot = ToyRobot::Command::Move.new(robot, table).execute
      resulting_robot.x.should eq(0)
      resulting_robot.y.should eq(1)
    end

    it "raises an exception when robot is on the north edge" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new
      robot.x = 0
      robot.y = ToyRobot::Table::DEFAULT_HEIGHT
      robot.direction = ToyRobot::Robot::Direction::NORTH

      expect_raises(ToyRobot::OutsideOfTable) do
        ToyRobot::Command::Move.new(robot, table).execute
      end
    end

    it "moves robot one unit forward in the south direction" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new
      robot.x = 0
      robot.y = ToyRobot::Table::DEFAULT_HEIGHT
      robot.direction = ToyRobot::Robot::Direction::SOUTH

      resulting_robot = ToyRobot::Command::Move.new(robot, table).execute
      resulting_robot.x.should eq(0)
      resulting_robot.y.should eq(ToyRobot::Table::DEFAULT_HEIGHT - 1)
    end

    it "raises an exception when robot is on the south edge" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new
      robot.x = 0
      robot.y = 0
      robot.direction = ToyRobot::Robot::Direction::SOUTH

      expect_raises(ToyRobot::OutsideOfTable) do
        ToyRobot::Command::Move.new(robot, table).execute
      end
    end

    it "moves robot one unit forward in the west direction" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new
      robot.x = ToyRobot::Table::DEFAULT_WIDTH
      robot.y = 0
      robot.direction = ToyRobot::Robot::Direction::WEST

      resulting_robot = ToyRobot::Command::Move.new(robot, table).execute
      resulting_robot.x.should eq(ToyRobot::Table::DEFAULT_WIDTH - 1)
      resulting_robot.y.should eq(0)
    end

    it "raises an exception when robot is on the west edge" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new
      robot.x = 0
      robot.y = 0
      robot.direction = ToyRobot::Robot::Direction::WEST

      expect_raises(ToyRobot::OutsideOfTable) do
        ToyRobot::Command::Move.new(robot, table).execute
      end
    end

    it "moves robot one unit forward in the east direction" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new
      robot.x = 0
      robot.y = 0
      robot.direction = ToyRobot::Robot::Direction::EAST

      resulting_robot = ToyRobot::Command::Move.new(robot, table).execute
      resulting_robot.x.should eq(1)
      resulting_robot.y.should eq(0)
    end

    it "raises an exception when robot is on the east edge" do
      table = ToyRobot::Table.new
      robot = ToyRobot::Robot.new
      robot.x = ToyRobot::Table::DEFAULT_WIDTH
      robot.y = 0
      robot.direction = ToyRobot::Robot::Direction::EAST

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
