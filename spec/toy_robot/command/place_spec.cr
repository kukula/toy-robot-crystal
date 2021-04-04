require "../../spec_helper"

describe ToyRobot::Command::Place do
  describe "#execute" do
    it "returns robot with new coordinates when places robot on the board" do
      robot = ToyRobot::Robot.new
      table = ToyRobot::Table.new
      ToyRobot::Command::Place
        .new(robot, table, STDOUT)
        .execute(
          ToyRobot::Table::DEFAULT_WIDTH,
          ToyRobot::Table::DEFAULT_HEIGHT,
          ToyRobot::Robot::Direction::NORTH)

      robot.x.should eq(ToyRobot::Table::DEFAULT_WIDTH)
      robot.y.should eq(ToyRobot::Table::DEFAULT_HEIGHT)
      robot.direction.should eq(ToyRobot::Robot::Direction::NORTH)
    end

    it "raises exception when can't place robot on the board" do
      robot = ToyRobot::Robot.new
      table = ToyRobot::Table.new

      expect_raises(ToyRobot::OutsideOfTable) do
        ToyRobot::Command::Place
          .new(robot, table, STDOUT)
          .execute(
            ToyRobot::Table::DEFAULT_WIDTH + 1,
            ToyRobot::Table::DEFAULT_HEIGHT,
            ToyRobot::Robot::Direction::NORTH,
          )
      end
    end
  end
end
