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
        display = HORIZONTAL_WALL_END
        for index in 0...length
            display = display + HORIZONTAL_WALL
        end
        display
    end
end