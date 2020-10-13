require "grid"

class WideScreenPresenter
    def show_display(grid)
        show_wide_screen_grid(grid.grid_array)
    end

    private

    def show_wide_screen_grid(grid_array)
        puts "-------------------------------
|     |     |     |     |     |
|     |     |     |     |     |
|     |     |     |     |     |
-------------------------------
|     |     | SKY |     |     |
|     |     |  X  |     |     |
|     |     | HIGH|     |     |
-------------------------------
|     |     |     | X X |     |
|     |     |     |  X  |     |
|     |     |     | X X |     |
-------------------------------
|     |     |     |     |     |
|     |     |     |     |     |
|     |     |     |     |     |
-------------------------------
|     |     |     |     |     |
|     |     |     |     |     |
|     |     |     |     |     |
-------------------------------"
    end
end