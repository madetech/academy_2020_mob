class Grid
    attr_accessor :grid_array

    def initialize(width, height)
        @width = width
        @height = height
        @grid_array = make_grid(width, height)
    end

    def make_grid (width, height)
        # build a (width x height) empty data structure
    end
end