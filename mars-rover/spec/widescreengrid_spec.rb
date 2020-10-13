require_relative '../lib/wide_screen_grid'
require_relative '../lib/grid'
require 'rover_spec_helper'

describe WideScreenGrid do
    context "#display_row" do	
        it "converts an empty single-cell grid row into a beautiful display" do
            # Arrange
            display_grid = WideScreenGrid.new
            cells = [""]
            EMPTY_CELL = 
"-------
|     |
|     |
|     |\n"

            # Act
            result = display_grid.display_row(cells)

            # Assert
            expect(result).to eq(EMPTY_CELL)
        end

        it "converts an empty multi-cell grid row into a beautiful display" do
            # Arrange
            display_grid = WideScreenGrid.new
            cells = ["", "", ""]
            EMPTY_ROW = 
"-------------------
|     |     |     |
|     |     |     |
|     |     |     |\n"

            # Act
            result = display_grid.display_row(cells)

            # Assert
            expect(result).to eq(EMPTY_ROW)
        end
    end	

    context "#row_line" do
        it "constructs a single-celled empty row line" do
            # Arrange
            display_grid = WideScreenGrid.new
            cells = [""]
            EMPTY_ROW_LINE = "|     |\n"

            # Act
            result = display_grid.row_line(cells)

            # Assert
            expect(result).to eq(EMPTY_ROW_LINE)
        end
        
        it "constructs a multi-celled empty row line" do
            # Arrange
            display_grid = WideScreenGrid.new
            cells = ["", "", "", ""]
            EMPTY_ROW_LINE = "|     |     |     |     |\n"

            # Act
            result = display_grid.row_line(cells)

            # Assert
            expect(result).to eq(EMPTY_ROW_LINE)
        end

        it "constructs a single-celled row line containing the first row of an obstacle" do
            # Arrange
            display_grid = WideScreenGrid.new
            cells = [Grid::OBSTACLE]
            EXPECTED_ROW_LINE = "| X X |\n"

            # Act
            result = display_grid.row_line(cells)

            # Assert
            expect(result).to eq(EXPECTED_ROW_LINE)
        end
    end

    context "#display_wall" do
        it "constructs a single-celled bottom wall" do
            # Arrange
            display_grid = WideScreenGrid.new
            EXPECTED_WALL = "-------\n"

            # Act
            result = display_grid.display_wall(1)

            # Assert
            expect(result).to eq(EXPECTED_WALL)
        end

        it "constructs a multi-celled bottom wall" do
            # Arrange
            display_grid = WideScreenGrid.new
            EXPECTED_WALL = "-------------------\n"

            # Act
            result = display_grid.display_wall(3)

            # Assert
            expect(result).to eq(EXPECTED_WALL)
        end
    end
end