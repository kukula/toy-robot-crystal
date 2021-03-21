module ToyRobot
  module CLI
    def self.run(input : IO::FileDescriptor)
      commander = Commander.new

      input.each_line do |line|
        next unless line
        result = commander.execute(line)
        next unless result

        STDOUT.puts result
      end
    end
  end
end
