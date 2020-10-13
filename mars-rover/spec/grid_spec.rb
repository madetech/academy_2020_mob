require_relative '../lib/grid'

describe "grid" do
    context "grid initialization" do
        xit "initializes a grid to the passed-in dimensions" do
            # Arrange
            EXPECTED_WIDTH = 5
            EXPECTED_HEIGHT = 5

            # Act
            grid = Grid.new(EXPECTED_WIDTH, EXPECTED_HEIGHT)

            # Assert
            expect(grid.grid_array.width).to eq(EXPECTED_WIDTH)
            expect(grid.grid_array.height).to eq(EXPECTED_HEIGHT)
        end

        xit "initializes a grid with all cells empty" do
            # Arrange
            WIDTH = 5
            HEIGHT = 5

            # Act
            grid = Grid.new(WIDTH, HEIGHT)

            # Assert            
            for row in 0...HEIGHT 
                for col in 0...WIDTH 
                    expect(grid.grid_array[row][col]).to eq(Grid::EMPTY_CELL)
                end
            end
        end
    end
    
    context "grid update" do
        xit "updates a grid to add the position and direction of the passed-in rover" do
            # Arrange
            EXPECTED_X = 2
            EXPECTED_Y = 3
            EXPECTED_DIRECTION = "S"
            grid = Grid.new(5, 5)
            fake_mars_rover = double('Rover360')
            allow(fake_mars_rover).to receive(:x).and_return(EXPECTED_X)
            allow(fake_mars_rover).to receive(:y).and_return(EXPECTED_Y)
            allow(fake_mars_rover).to receive(:direction).and_return(EXPECTED_DIRECTION)

            # Act
            grid.update(fake_mars_rover)

            # Assert
            expect(grid.grid_array[EXPECTED_X][EXPECTED_Y]).to eq(EXPECTED_DIRECTION)  
        end

        xit "only populates one grid cell when passed a rover" do
            # Arrange
            EXPECTED_X = 2
            EXPECTED_Y = 3
            EXPECTED_DIRECTION = "S"
            grid = Grid.new(5, 5)
            fake_mars_rover = double('Rover360')
            allow(fake_mars_rover).to receive(:x).and_return(EXPECTED_X)
            allow(fake_mars_rover).to receive(:y).and_return(EXPECTED_Y)
            allow(fake_mars_rover).to receive(:direction).and_return(EXPECTED_DIRECTION)

            # Act
            grid.update(fake_mars_rover)

            # Assert
            expect(grid.grid_array[EXPECTED_X][EXPECTED_Y]).to eq(EXPECTED_DIRECTION)          
            for row in 0...HEIGHT 
                for col in 0...WIDTH 
                    if (row != EXPECTED_Y && col != EXPECTED_X)
                        expect(grid.grid_array[row][col]).to eq(Grid::EMPTY_CELL)
                    end
                end
            end
        end
    end
    
    context "obstacle management" do
        it "will add an obstacle" do
            # Arrange
            OBSTACLE_X = 4
            OBSTACLE_Y = 1
            grid = Grid.new(5, 5)

            # Act
            grid.add_obstacle(OBSTACLE_X, OBSTACLE_Y)

            # Assert
            expect(grid.grid_array[OBSTACLE_X][OBSTACLE_Y]).to eq(Grid::OBSTACLE)
        end

        it "will add a sky-high obstacle" do
            # Arrange
            OBSTACLE_X = 2
            OBSTACLE_Y = 2
            grid = Grid.new(5, 5)

            # Act
            grid.add_sky_high_obstacle(OBSTACLE_X, OBSTACLE_Y)

            # Assert
            expect(grid.grid_array[OBSTACLE_X][OBSTACLE_Y]).to eq(Grid::SKY_HIGH_OBSTACLE)
        end

        xit "will indicate when an obstacle is present" do
            # Arrange
            OBSTACLE_X = 2
            OBSTACLE_Y = 3
            grid = Grid.new(5, 5)
            grid.add_obstacle(OBSTACLE_X, OBSTACLE_Y)

            # Act
            result = grid.contains_obstacle?(OBSTACLE_X, OBSTACLE_Y)

            # Assert
            expect(result).to eq(true)
        end

        xit "will count a Mars Rover as an obstacle" do
            # Arrange
            ROVER_X = 2
            ROVER_Y = 3
            grid = Grid.new(5, 5)
            fake_mars_rover = double('Rover360')
            allow(fake_mars_rover).to receive(:x).and_return(ROVER_X)
            allow(fake_mars_rover).to receive(:y).and_return(ROVER_Y)
            allow(fake_mars_rover).to receive(:direction).and_return(StraightLineRover::SOUTH)
            grid.update(fake_mars_rover)

            # Act
            result = grid.contains_obstacle?(ROVER_X, ROVER_Y)

            # Assert
            expect(result).to eq(true)
        end

        xit "will maintain obstacles when updating the display" do
            # Arrange
            OBSTACLE_X = 2
            OBSTACLE_Y = 3
            grid = Grid.new(5, 5)
            grid.add_obstacle(OBSTACLE_X, OBSTACLE_Y)
            fake_mars_rover = double('Rover360')
            allow(fake_mars_rover).to receive(:x).and_return(OBSTACLE_X + 1)
            allow(fake_mars_rover).to receive(:y).and_return(OBSTACLE_Y + 1)
            allow(fake_mars_rover).to receive(:direction).and_return(StraightLineRover::SOUTH)

            # Act
            grid.update(fake_mars_rover)

            # Assert
            expect(grid.grid_array[OBSTACLE_X][OBSTACLE_Y]).to eq(Grid::OBSTACLE)  
        end
    end
end