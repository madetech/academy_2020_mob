class WideScreenGrid 
    HORIZONTAL_WALL = "------"
    HORIZONTAL_WALL_END = "-"
    EMPTY_CELL_PART = "|     "
    VERTICAL_WALL = "|"

    def display_row(cells)
        "-------------------
|     |     |     |
|     |     |     |
|     |     |     |\n"
    end

    def cell_parts(cell)
    end

    def display_bottom_wall(length)
        "-------------------"
    end
end