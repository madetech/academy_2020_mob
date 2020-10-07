class Grid
    attr_accessor :grid_array
    EMPTY_CELL = ""

    def initialize(width, height)
        @width = width
        @height = height
        @grid_array = make_grid(width, height)
    end

    def update(mars_rover)
        populate_cell(mars_rover)
    end

    private

    def populate_cell(mars_rover)
        empty_all_cells
        grid_array[mars_rover.x][mars_rover.y] = mars_rover.direction
    end

    def empty_all_cells           
        for x in 0...@height 
            for y in 0...@width 
                grid_array[x][y] = EMPTY_CELL
            end
        end
    end

    def make_grid (width, height)
        # build a (width x height) empty data structure
    end
end