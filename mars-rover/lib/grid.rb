class Grid
    attr_accessor :grid_array
    EMPTY_CELL = ""
    OBSTACLE = "X"
    SKY_HIGH_OBSTACLE = "Y"

    def initialize(width, height)
        @width = width
        @height = height
        @grid_array = make_grid(width, height)
    end

    def update(mars_rover)
        populate_cell(mars_rover)
    end

    def add_obstacle(x, y)
        grid_array[y][x] = OBSTACLE
    end

    def add_sky_high_obstacle(x, y)
        grid_array[y][x] = SKY_HIGH_OBSTACLE
    end

    def contains_obstacle?(x, y)
        grid_array[y][x] != EMPTY_CELL
    end

    def contains_sky_high_obstacle?(x, y)
        grid_array[y][x] == SKY_HIGH_OBSTACLE
    end

    private

    def populate_cell(mars_rover)
        # ! Can't just empty all cells any more - needs to persist obstacles
        empty_all_cells
        grid_array[mars_rover.y][mars_rover.x] = {
            :direction => mars_rover.get_direction, 
            :name => mars_rover.name,
            :type => mars_rover.type
        }
    end

    def empty_all_cells           
        for x in 0...@height 
            for y in 0...@width 
                grid_array[y][x] = EMPTY_CELL
            end
        end
    end

    def make_grid (width, height)
        Array.new(width){ Array.new(height) { "" } }
    end
end