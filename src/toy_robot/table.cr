module ToyRobot
  struct Table
    DEFAULT_WIDTH  = 5
    DEFAULT_HEIGHT = 5

    property width : Int32
    property height : Int32

    def initialize(@width = DEFAULT_WIDTH, @height = DEFAULT_HEIGHT)
    end

    def fits?(robot : Robot) : Bool
      return false unless robot.placed?

      (0..width).includes?(robot.x.as(Int32)) &&
        (0..height).includes?(robot.y.as(Int32))
    end
  end
end
