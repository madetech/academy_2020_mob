class RoverSpecHelper
    def self.make_real_grid(
            width, 
            height, 
            obstacle_coords=[], 
            sky_high_obstacle_coords=[])
        grid = Grid.new(width, height)
        grid.add_obstacle(obstacle_coords)
        grid.add_sky_high_obstacle(sky_high_obstacle_coords)
    end

    def self.make_real_grid_with_rover(
            width, 
            height, 
            x, 
            y, 
            direction, 
            obstacle_coords=[], 
            sky_high_obstacle_coords=[])
        mars_rover = Rover360.new("TST")
        mars_rover.start(x, y, direction)
        grid = Grid.new(width, height)
        grid.add_obstacle(obstacle_coords)
        grid.add_sky_high_obstacle(sky_high_obstacle_coords)
        grid.update(mars_rover)
    end

    def self.make_fake_grid(x, y, direction, obstacle_coords=[], sky_high_obstacle_coords=[])  
        fake_grid = double('Grid')
        allow(fake_grid).to receive(:grid_array)
            .and_return(self.make_fake_grid_array(x, y, direction, obstacle_coords_1, obstacle_coords_2))
        fake_grid
    end

    private

    def self.make_fake_grid_array(x, y, direction, obstacle_coords_1=[], obstacle_coords_2=[])        
        # Build a fake 5x5 grid array with a Mars Rover at the specified position and facing the specified direction
        # and with obstacles in the specified locations
    end
end