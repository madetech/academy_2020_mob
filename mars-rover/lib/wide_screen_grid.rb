require 'straight_line_rover'

class WideScreenGrid 
    HORIZONTAL_WALL = "------"
    HORIZONTAL_WALL_END = "-\n"
    EMPTY_CELL_PART = "|     "
    OBSTACLE_CELL_PART_01 = "| X X "
    SKY_HIGH_OBSTACLE_CELL_PART_01 = "| SKY "
    ROW_END = "|\n"
    CELL_PARTS = {
        Grid::EMPTY_CELL => EMPTY_CELL_PART,
        Grid::OBSTACLE => OBSTACLE_CELL_PART_01,
        Grid::SKY_HIGH_OBSTACLE => SKY_HIGH_OBSTACLE_CELL_PART_01
    }

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
            row_line = row_line + CELL_PARTS[cells[index]]
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