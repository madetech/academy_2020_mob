require 'marsrover'

class MarsRoverFactory
    def generate_rover(name)
        MarsRover.new(name)
    end
end