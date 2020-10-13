class WideScreenGrid 
    HORIZONTAL_WALL = "------"
    HORIZONTAL_WALL_END = "-\n"
    EMPTY_CELL_PART = "|     "
    ROW_END = "|\n"

    def display_row(cells)
        display = display_wall(cells.length)
        for index in 1..3
            display = display + row_line(cells)
        end
        display
    end	

    def row_line(cells)
        row_line = ""
        for index in 0...cells.length
            row_line = row_line + EMPTY_CELL_PART
        end
        row_line = row_line + ROW_END
    end

    def display_wall(length)
        display = ""
        for index in 0...length
            display = display + HORIZONTAL_WALL
        end
        display = display + HORIZONTAL_WALL_END
        display   
    end
end