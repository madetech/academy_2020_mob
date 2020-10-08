require 'straight_line_rover'
require 'rover360'

class MarsRoverFactory
    def generate_rover(name, type)
        case type 
        when "SLR"
            StraightLineRover.new(name)
        when "360"
            Rover360.new(name)
        end
    end
end