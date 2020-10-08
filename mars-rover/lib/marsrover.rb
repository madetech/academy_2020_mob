class MarsRover
    attr_accessor :x, :y, :direction, :name

    EAST = "E"
    WEST = "W"
    NORTH = "N"
    SOUTH = "S"
    FORWARD = "f"
    BACKWARD = "b"

    def initialize(name)
        @name = name
    end

    def start(x, y, direction)
        @x = x
        @y = y
        @direction = direction
    end

    def move(movement, grid)
        # The current assumption is that movement is a string containing either FORWARD or BACKWARD.
        # Add the ability to move forwards or backwards in any direction
        # Add the ability to "wrap" around the edges of the grid.
        # Add obstacle detection (see detect_obstacle method)
        # See test specs in grid_spec.rb.
        if @direction == NORTH
            @x = @x + 1            
        elsif @direction == EAST
            @y = @y + 1
        end
    end

    def turn(turn)
        # The current assumption is that turn is a string containing either LEFT or RIGHT.
        # Add the ability to turn in any direction from any direction
        # See test specs in grid_spec.rb.
    end

    def detect_obstacle(x, y, grid)
        if grid.contains_obstacle?(x, y)
            raise ObstacleException.new
        end
    end
end