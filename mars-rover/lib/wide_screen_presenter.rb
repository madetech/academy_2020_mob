require "grid"

class WideScreenPresenter
    def show_display(grid)
        show_wide_screen_grid(grid.grid_array)
    end

    private

    def show_wide_screen_grid(grid_array)
        # Turn grid array into something that looks something like this:
        # (Note that this is an advanced imagined future version 
        # with obstacles and multiple named rovers)

        # -------------------------------
        # |     |     |     |     | X X |
        # |     |     |     |     |  X  |
        # |     |     |     |     | X X |
        # -------------------------------
        # | ^ J |     | | M |     |     |
        # | | I |     | | E |     |     |
        # | | M |     | v G |     |     |
        # -------------------------------
        # |     | X X |     |     |     |
        # |     |  X  |     |     |     |
        # |     | X X |     |     |     |
        # -------------------------------
        # |     |     |     |     |     |
        # |     | --> |     | <-- |     |
        # |     | JAN |     | ENA |     |
        # -------------------------------
        # |     |     |     |     |     |
        # |     |     |     |     |     |
        # |     |     |     |     |     |
        # -------------------------------
    end
end