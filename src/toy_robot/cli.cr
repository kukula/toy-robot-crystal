module ToyRobot
  module CLI
    def self.run(input : IO::FileDescriptor, output : IO::FileDescriptor)
      commander = Commander.new

      input.each_line do |line|
        next unless line
        result = commander.execute(line)
        next unless result

        output.puts result
      end
    end
  end
end
