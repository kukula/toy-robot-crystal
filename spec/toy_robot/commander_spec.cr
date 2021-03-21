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

        commander.parse(input).should eq(nil)
      end
    end

    describe "MOVE command" do
      it "returns move command when it is posible" do
        input = "MOVE"
        commander = ToyRobot::Commander.new

        commander.parse(input).should be_a(ToyRobot::Command::Move)
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
end
