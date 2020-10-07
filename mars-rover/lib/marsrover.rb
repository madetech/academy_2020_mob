class MarsRover
    attr_accessor :x, :y, :direction

    def start(x, y, direction)
        @x = x
        @y = y
        @direction = direction
    end

    def move(movement)
        @x = @x + 1
    end
end