require "./toy_robot/*"

module ToyRobot
  VERSION = "0.1.0"

  class UnrecognisedCommand < Exception
  end

  class NotPlaced < Exception
  end

  class OutsideOfTable < Exception
  end

  class WrongDirection < Exception
  end
end
