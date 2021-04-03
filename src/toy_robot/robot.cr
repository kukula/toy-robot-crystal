module ToyRobot
  class Robot
    enum Direction
      NORTH
      EAST
      SOUTH
      WEST
    end

    property x : Int32?
    property y : Int32?
    property direction : Direction?

    def initialize(@x = nil, @y = nil, @direction = nil)
    end

    def placed? : Bool
      !x.nil? && !y.nil? && !direction.nil?
    end

    def to_s : String
      [x, y, direction].join(",")
    end
  end
end
