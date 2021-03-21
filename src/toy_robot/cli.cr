module ToyRobot
  module CLI
    def self.run(args : Array(String))
      commander = ToyRobot::Commander.new

      STDIN.each_line do |input|
        commander.parse(input) if input
        break if input =~ /exit/i
      end
    end
  end
end
