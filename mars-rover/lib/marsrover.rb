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
        # The current assumption is that movement is a string containing either FORWARD or BACKWARD.
        # Add the ability to move forwards or backwards in any direction
        # Add the ability to "wrap" around the edges of the grid.
        # Add obstacle detection
        # See test specs in grid_spec.rb.
        if @direction == NORTH
            @x = @x + 1            
        elsif @direction == EAST
            @y = @y + 1
        end
    end
end