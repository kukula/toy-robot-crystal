require "../spec_helper"

describe ToyRobot::CLI do
  describe "#run" do
    it "outputs report for a placed robot" do
      output = Stdio.capture do |io|
        toy = ToyRobot::CLI.new(STDOUT, STDERR)
        toy.run("PLACE 7,3,EAST")
        toy.run("REPORT")

        io.out.gets
      end

      expected_output = "7,3,EAST"
      output.should eq expected_output
    end

    it "outputs error when unplaced robot is requested to report" do
      error_output = Stdio.capture do |io|
        toy = ToyRobot::CLI.new(STDOUT, STDERR)
        toy.run("REPORT")

        io.err.gets
      end

      expected_error_output = "Ignored error for input 'REPORT': You need to place the robot before requesting a report"
      error_output.should eq expected_error_output
    end
  end
end
