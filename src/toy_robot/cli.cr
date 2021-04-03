module ToyRobot
  module CLI
    def self.run(
      input : IO::FileDescriptor,
      output : IO::FileDescriptor,
      error_output : IO::FileDescriptor
    )
      commander = Commander.new(output, error_output)

      input.each_line do |line|
        next unless line
        commander.execute(line)
      end
    end
  end
end
