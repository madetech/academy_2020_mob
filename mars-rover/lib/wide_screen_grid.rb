require_relative 'straight_line_rover'

class WideScreenGrid 
    HORIZONTAL_WALL = "------"
    HORIZONTAL_WALL_END = "-\n"
    EMPTY_CELL_PART = "|     "
    OBSTACLE_CELL_PART_01 = "| X X "
    OBSTACLE_CELL_PART_02 = "|  X  "
    NORTH_ROVER_CELL_PART_02 = "| ^^^ "
    SOUTH_ROVER_CELL_PART_02 = "| vvv "
    EAST_ROVER_CELL_PART_02 = "| <<< "
    WEST_ROVER_CELL_PART_02 = "| >>> "
    SKY_HIGH_OBSTACLE_CELL_PART_01 = "| SKY "
    SKY_HIGH_OBSTACLE_CELL_PART_03 = "| HIGH"
    ROW_END = "|\n"

    CELL_PARTS = [{
        Grid::EMPTY_CELL => EMPTY_CELL_PART,
        Grid::OBSTACLE => OBSTACLE_CELL_PART_01,
        Grid::SKY_HIGH_OBSTACLE => SKY_HIGH_OBSTACLE_CELL_PART_01
    }, {
        Grid::EMPTY_CELL => EMPTY_CELL_PART,
        Grid::OBSTACLE => OBSTACLE_CELL_PART_02,
        Grid::SKY_HIGH_OBSTACLE => OBSTACLE_CELL_PART_02,
        StraightLineRover::NORTH => NORTH_ROVER_CELL_PART_02,
        StraightLineRover::SOUTH => SOUTH_ROVER_CELL_PART_02,
        Rover360::EAST => EAST_ROVER_CELL_PART_02,
        Rover360::WEST => WEST_ROVER_CELL_PART_02
    }, {
        Grid::EMPTY_CELL => EMPTY_CELL_PART,
        Grid::OBSTACLE => OBSTACLE_CELL_PART_01,
        Grid::SKY_HIGH_OBSTACLE => SKY_HIGH_OBSTACLE_CELL_PART_03
    }]

    def display_row(cells)
        display = display_wall(cells.length)
        for index in 0...3
            display = display + row_line(cells, index)
        end
        display
    end	

    def row_line(cells, row_index)
        row_line = ""
        for cell_index in 0...cells.length
            row_line = row_line + CELL_PARTS[row_index][cells[cell_index]]
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