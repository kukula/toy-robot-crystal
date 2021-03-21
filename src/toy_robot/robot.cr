module ToyRobot
  struct Robot
    enum Direction
      NORTH
      EAST
      SOUTH
      WEST
    end

    property x : Int32?
    property y : Int32?
    property direction : Direction?

    def placed? : Bool
      !x.nil? && !y.nil? && !direction.nil?
    end
  end
end
