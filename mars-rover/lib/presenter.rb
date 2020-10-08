require "grid"

class Presenter
    def show_display(grid)
        show_grid(grid.grid_array)
    end

    private

    def show_grid(grid_array)
        puts grid_array
    end
end