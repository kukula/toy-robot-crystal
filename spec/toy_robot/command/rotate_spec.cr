require "../../spec_helper"

describe ToyRobot::Command::Rotate do
  describe "#execute" do
    it "rotates the robot 90 degrees right: North -> East" do
      robot = ToyRobot::Robot.new(0, 0, ToyRobot::Robot::Direction::NORTH)

      resulting_robot = ToyRobot::Command::Rotate
        .new(robot, ToyRobot::Command::Rotate::Direction::RIGHT)
        .execute

      resulting_robot.direction.should eq(ToyRobot::Robot::Direction::EAST)
    end

    it "rotates the robot 90 degrees left: North -> West" do
      robot = ToyRobot::Robot.new(0, 0, ToyRobot::Robot::Direction::NORTH)

      resulting_robot = ToyRobot::Command::Rotate
        .new(robot, ToyRobot::Command::Rotate::Direction::LEFT)
        .execute

      resulting_robot.direction.should eq(ToyRobot::Robot::Direction::WEST)
    end

    it "rotates the robot 90 degrees right: West -> North" do
      robot = ToyRobot::Robot.new(0, 0, ToyRobot::Robot::Direction::WEST)

      resulting_robot = ToyRobot::Command::Rotate
        .new(robot, ToyRobot::Command::Rotate::Direction::RIGHT)
        .execute

      resulting_robot.direction.should eq(ToyRobot::Robot::Direction::NORTH)
    end

    it "rotates the robot 90 degrees left: West -> South" do
      robot = ToyRobot::Robot.new(0, 0, ToyRobot::Robot::Direction::WEST)

      resulting_robot = ToyRobot::Command::Rotate
        .new(robot, ToyRobot::Command::Rotate::Direction::LEFT)
        .execute

      resulting_robot.direction.should eq(ToyRobot::Robot::Direction::SOUTH)
    end

    it "raises an exception when robot is not placed" do
      robot = ToyRobot::Robot.new

      expect_raises(ToyRobot::NotPlaced) do
        ToyRobot::Command::Rotate.new(robot, ToyRobot::Command::Rotate::Direction::RIGHT).execute
      end
    end
  end
end
