require_relative '../grid'
require_relative 'straight_line_rover'
require_relative '../compass_direction'

class Rover360 < StraightLineRover
    attr_accessor :x, :y, :direction, :name, :type

    LEFT = "l"
    RIGHT = "r"
    ROVER_360 = "360"

    def initialize(name)
        super(name)
        @type = ROVER_360
    end

    def start(x, y, direction, grid)
        @x = x
        @y = y
        @direction = direction
        @direction_object = CompassDirection.new(@direction)
        detect_obstacle(x, y, grid)
    end

    def turn(turn)
        # The current assumption is that turn is a string containing either LEFT or RIGHT.
        # Add the ability to turn in any direction from any direction
        # In this class you turn 90 degrees for each turn
    end

    def go_east
        # to do: implement
    end

    def go_west
        # to do: implement
    end

    def get_direction_object
        @direction_object
    end
end