require 'grid'
require 'straight_line_rover'

class Rover360 < StraightLineRover
    attr_accessor :x, :y, :direction, :name, :type

    def initialize(name)
        super(name)
        @type = ROVER_360
    end

    def start(x, y, direction)
        @x = x
        @y = y
        @direction = direction
        @direction_object = new CompassDirection(@direction)
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