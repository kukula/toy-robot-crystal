module ToyRobot
  enum Direction
    North
    South
    East
    West
  end

  struct Robot
    property x : Int32?
    property y : Int32?
    property direction : Direction?

    def placed?
      !x.nil? && !y.nil? && !direction.nil?
    end
  end
end
