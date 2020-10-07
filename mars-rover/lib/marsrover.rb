class MarsRover
    attr_accessor :x, :y, :direction

    EAST = "E"
    WEST = "W"
    NORTH = "N"
    SOUTH = "S"
    FORWARD = "f"
    BACKWARD = "b"

    def start(x, y, direction)
        @x = x
        @y = y
        @direction = direction
    end

    def move(movement)
        if @direction == NORTH
            @x = @x + 1            
        elsif @direction == EAST
            @y = @y + 1
        end
    end
end