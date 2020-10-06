class MarsRover
    attr_accessor :x, :y, :direction

    def initialize(x, y, direction)
        @x = x
        @y = y
        @direction = direction
    end

    def move(x, y, direction)
        initialize(x, y, direction)
    end
end