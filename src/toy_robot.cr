require "./toy_robot/*"

module ToyRobot
  VERSION = "0.1.0"

  class NotPlaced < Exception
  end

  class OutsideOfTable < Exception
  end

  class WrongDirection < Exception
  end
end
