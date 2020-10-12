class CompassDirection < StraightLineDirection
    def is_east?
        @direction == StraightLineRover::EAST
    end

    def is_west?
        @direction == StraightLineRover::WEST
    end
end