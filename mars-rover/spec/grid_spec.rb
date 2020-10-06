require_relative '../lib/grid'

describe "grid" do
    context "grid initialization" do
        it "initializes a grid to the passed-in dimensions" do
            # Arrange
            EXPECTED_WIDTH = 5
            EXPECTED_HEIGHT = 5

            # Act
            grid = Grid.new(EXPECTED_WIDTH, EXPECTED_HEIGHT)

            # Assert
            expect(grid.grid_array.width).to eq(EXPECTED_WIDTH)
            expect(grid.grid_array.height).to eq(EXPECTED_HEIGHT)
        end
    end
end