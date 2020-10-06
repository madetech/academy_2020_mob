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

        it "initializes a grid with all cells empty" do
            # Arrange
            WIDTH = 5
            HEIGHT = 5
            EMPTY_CELL = ""

            # Act
            grid = Grid.new(WIDTH, HEIGHT)

            # Assert            
            for row in 0...HEIGHT 
                for col in 0...WIDTH 
                    expect(grid.grid_array[row, col]).to eq(EMPTY_CELL)
                end
            end
        end
    end
    
    context "grid update" do
        it "updates a grid to add the position and direction of the passed-in rover" do
            # Arrange
            EXPECTED_X = 2
            EXPECTED_Y = 3
            EXPECTED_DIRECTION = "S"
            EMPTY_CELL = ""
            grid = Grid.new(5, 5)
            fake_mars_rover = MarsRover.fake(
                x => EXPECTED_X, 
                y => EXPECTED_Y,
                direction => EXPECTED_DIRECTION)

            # Act
            grid.update(fake_mars_rover)

            # Assert
            expect(grid.grid_array[EXPECTED_X, EXPECTED_Y]).to eq(EXPECTED_DIRECTION)  
        end

        it "only populates one grid cell when passed a rover" do
            # Arrange
            EXPECTED_X = 2
            EXPECTED_Y = 3
            EXPECTED_DIRECTION = "S"
            EMPTY_CELL = ""
            grid = Grid.new(5, 5)
            fake_mars_rover = MarsRover.fake(
                x => EXPECTED_X, 
                y => EXPECTED_Y,
                direction => EXPECTED_DIRECTION)

            # Act
            grid.update(fake_mars_rover)

            # Assert
            expect(grid.grid_array[EXPECTED_X, EXPECTED_Y]).to eq(EXPECTED_DIRECTION)          
            for row in 0...HEIGHT 
                for col in 0...WIDTH 
                    if (row != EXPECTED_Y && col != EXPECTED_X)
                        expect(grid.grid_array[row, col]).to eq(EMPTY_CELL)
                    end
                end
            end
        end
    end
end