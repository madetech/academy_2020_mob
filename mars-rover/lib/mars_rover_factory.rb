require 'straight_line_rover'
require 'rover360'
require 'flying_rover'

class MarsRoverFactory
    def generate_rover(name, type)
        case type 
        when "SLR"
            StraightLineRover.new(name)
        when "360"
            Rover360.new(name)
        when "FLY"
            FlyingRover.new(name)
        end
    end
end