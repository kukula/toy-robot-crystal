require "../spec_helper"

describe ToyRobot::Commander do
  describe "#parse" do
    describe "PLACE command" do
      it "returns place command when the input is right" do
        input = "PLACE 0,0,NORTH"
        commander = ToyRobot::Commander.new

        commander.parse(input).should be_a(ToyRobot::Command::Place)
      end

      it "returns nil when the input isn't right" do
        input = "PLACE 0 0 NORTH"
        commander = ToyRobot::Commander.new

        expect_raises(ToyRobot::UnrecognisedCommand) do
          commander.parse(input)
        end
      end
    end

    describe "MOVE command" do
      it "returns move command when it is posible" do
        input = "MOVE"
        commander = ToyRobot::Commander.new

        commander.parse(input).should be_a(ToyRobot::Command::Move)
      end
    end

    describe "RIGHT command" do
      it "returns rotate command" do
        input = "RIGHT"
        commander = ToyRobot::Commander.new

        command = commander.parse(input)
        command.should be_a(ToyRobot::Command::Rotate)
      end
    end

    describe "LEFT command" do
      it "returns rotate command" do
        input = "LEFT"
        commander = ToyRobot::Commander.new

        command = commander.parse(input)
        command.should be_a(ToyRobot::Command::Rotate)
      end
    end

    describe "REPORT command" do
      it "returns report command" do
        input = "REPORT"
        commander = ToyRobot::Commander.new

        commander.parse(input).should be_a(ToyRobot::Command::Report)
      end
    end
  end

  describe "#execute" do
    it "updates robot after a move and returns nil when move" do
      input = "MOVE"
      robot = ToyRobot::Robot.new
      robot.x = 0
      robot.y = 0
      robot.direction = ToyRobot::Robot::Direction::NORTH
      commander = ToyRobot::Commander.new
      commander.robot = robot

      commander.robot.y.should eq(0)
      commander.execute(input).should be_nil
      commander.robot.y.should eq(1)
    end

    it "returns report" do
      input = "Report"
      robot = ToyRobot::Robot.new
      robot.x = 4
      robot.y = 2
      robot.direction = ToyRobot::Robot::Direction::WEST
      commander = ToyRobot::Commander.new
      commander.robot = robot

      commander.execute(input).should eq("4,2,WEST")
    end
  end
end
