require_relative '../lib/wide_screen_grid'
require_relative '../lib/grid'
require 'rover_spec_helper'

describe WideScreenGrid do
    context "#display_row" do
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

    context "#display_bottom_wall" do
        it "constructs a single-celled bottom wall" do
            # Arrange
            display_grid = WideScreenGrid.new

            # Act
            result = display_grid.display_bottom_wall(1)

            # Assert
            expect(result).to eq("#{WideScreenGrid::HORIZONTAL_WALL}#{WideScreenGrid::HORIZONTAL_WALL_END}")
        end

        it "constructs a multi-celled bottom wall" do
            # Arrange
            display_grid = WideScreenGrid.new

            # Act
            result = display_grid.display_bottom_wall(3)

            # Assert
            expect(result).to eq("#{WideScreenGrid::HORIZONTAL_WALL}#{WideScreenGrid::HORIZONTAL_WALL}#{WideScreenGrid::HORIZONTAL_WALL}#{WideScreenGrid::HORIZONTAL_WALL_END}")
        end
    end
end