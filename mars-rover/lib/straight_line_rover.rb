require 'grid'

class StraightLineRover
    attr_accessor :x, :y, :direction, :name, :type

    NORTH = "N"
    SOUTH = "S"
    FORWARD = "f"
    BACKWARD = "b"
    STRAIGHT_LINE = "SLR"
    EAST = "E"
    WEST = "W"
    ROVER_360 = "360"

    def initialize(name)
        @name = name
        @type = STRAIGHT_LINE
    end

    def start(x, y, direction)
        @x = x
        @y = y
        @direction = direction
        # throw error if direction is east or west
        # this error will need to be caught and handled higher up the call chain
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
        # In this class you turn 180 degrees for each turn
    end

    def detect_obstacle(x, y, grid)
        if grid.contains_obstacle?(x, y)
            raise ObstacleException.new
        end
    end

    def go_north
        # to do: implement
    end

    def go_south
        # to do: implement
    end
end