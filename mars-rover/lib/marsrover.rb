class MarsRover
    attr_accessor :x, :y, :direction

    def move(x, y, direction)
        @x = x
        @y = y
        @direction = direction
    end
end