module ToyRobot
  struct Robot
    enum Direction
      NORTH
      SOUTH
      EAST
      WEST
    end

    property x : Int32?
    property y : Int32?
    property direction : Direction?

    def placed?
      !x.nil? && !y.nil? && !direction.nil?
    end
  end
end
