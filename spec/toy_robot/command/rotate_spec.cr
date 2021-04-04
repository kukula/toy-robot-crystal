require "../../spec_helper"

describe ToyRobot::Command::Rotate do
  describe "#execute" do
    it "rotates the robot 90 degrees right: North -> East" do
      robot = ToyRobot::Robot.new(0, 0, ToyRobot::Robot::Direction::NORTH)

      ToyRobot::Command::Rotate
        .new(robot, ToyRobot::Table.new, STDOUT)
        .execute(ToyRobot::Command::Rotate::RotateDirection::RIGHT)

      robot.direction.should eq(ToyRobot::Robot::Direction::EAST)
    end

    it "rotates the robot 90 degrees left: North -> West" do
      robot = ToyRobot::Robot.new(0, 0, ToyRobot::Robot::Direction::NORTH)

      ToyRobot::Command::Rotate
        .new(robot, ToyRobot::Table.new, STDOUT)
        .execute(ToyRobot::Command::Rotate::RotateDirection::LEFT)

      robot.direction.should eq(ToyRobot::Robot::Direction::WEST)
    end

    it "rotates the robot 90 degrees right: West -> North" do
      robot = ToyRobot::Robot.new(0, 0, ToyRobot::Robot::Direction::WEST)

      ToyRobot::Command::Rotate
        .new(robot, ToyRobot::Table.new, STDOUT)
        .execute(ToyRobot::Command::Rotate::RotateDirection::RIGHT)

      robot.direction.should eq(ToyRobot::Robot::Direction::NORTH)
    end

    it "rotates the robot 90 degrees left: West -> South" do
      robot = ToyRobot::Robot.new(0, 0, ToyRobot::Robot::Direction::WEST)

      ToyRobot::Command::Rotate
        .new(robot, ToyRobot::Table.new, STDOUT)
        .execute(ToyRobot::Command::Rotate::RotateDirection::LEFT)

      robot.direction.should eq(ToyRobot::Robot::Direction::SOUTH)
    end

    it "raises an exception when robot is not placed" do
      robot = ToyRobot::Robot.new

      expect_raises(ToyRobot::NotPlaced) do
        ToyRobot::Command::Rotate
          .new(robot, ToyRobot::Table.new, STDOUT)
          .execute(ToyRobot::Command::Rotate::RotateDirection::LEFT)
      end
    end
  end
end
