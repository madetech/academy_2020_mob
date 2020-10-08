class FlyingRover < Rover360
    def detect_obstacle(x, y, grid)
        if grid.contains_sky_high_obstacle?(x, y)
            raise SkyHighObstacleException.new
        end
    end
end