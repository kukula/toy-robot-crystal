module ToyRobot
  class CLI
    property output : IO::FileDescriptor
    property error_output : IO::FileDescriptor
    property commander : Commander

    def initialize(@output : IO::FileDescriptor, @error_output : IO::FileDescriptor)
      @commander = Commander.new(output)
    end

    def run
      STDIN.each_line do |line|
        next if line.nil? || line.empty?
        run(line)
      end
    end

    def run(line : String)
      commander.execute(line)
    rescue ex : UnrecognisedCommand | NotPlaced | OutsideOfTable | WrongDirection
      error_output.puts "Ignored error for input '#{line}': #{ex.message}"
    end
  end
end
