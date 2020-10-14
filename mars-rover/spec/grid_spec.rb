require_relative '../lib/grid'

describe Grid do
    context "grid initialization" do
        it "initializes a grid to the passed-in dimensions" do
            # Arrange
            EXPECTED_WIDTH = 5
            EXPECTED_HEIGHT = 5

            # Act
            grid = described_class.new(EXPECTED_WIDTH, EXPECTED_HEIGHT)

            # Assert
            expect(grid.width).to eq(EXPECTED_WIDTH)
            expect(grid.height).to eq(EXPECTED_HEIGHT)
        end

        it "initializes a grid with all cells empty" do
            # Arrange
            WIDTH = 5
            HEIGHT = 5

            # Act
            grid = described_class.new(WIDTH, HEIGHT)

            # Assert            
            for row in 0...HEIGHT 
                for col in 0...WIDTH 
                    expect(grid.grid_array[col][row]).to eq(Grid::EMPTY_CELL)
                end
            end
        end
    end
    
    context "grid update" do
        it "updates a grid to add the passed-in rover" do
            # Arrange
            EXPECTED_X = 2
            EXPECTED_Y = 3
            EXPECTED_DIRECTION = StraightLineRover::SOUTH
            grid = described_class.new(5, 5)
            mars_rover = Rover360.new("TST")
            mars_rover.start(EXPECTED_X, EXPECTED_Y, EXPECTED_DIRECTION)

            # Act
            grid.update(mars_rover)

            # Assert
            expect(grid.grid_array[EXPECTED_Y][EXPECTED_X]).to eq(mars_rover)  
        end

        it "only populates one grid cell when passed a rover" do
            # Arrange
            EXPECTED_X = 2
            EXPECTED_Y = 3
            grid = described_class.new(5, 5)
            mars_rover = Rover360.new("TST")
            mars_rover.start(EXPECTED_X, EXPECTED_Y, StraightLineRover::SOUTH)

            # Act
            grid.update(mars_rover)

            # Assert
            expect(grid.grid_array[EXPECTED_Y][EXPECTED_X]).to eq(mars_rover)          
            for row in 0...HEIGHT 
                for col in 0...WIDTH 
                    if (col != EXPECTED_Y && row != EXPECTED_X)
                        expect(grid.grid_array[col][row]).to eq(Grid::EMPTY_CELL)
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
            grid = described_class.new(5, 5)

            # Act
            grid.add_obstacle(OBSTACLE_X, OBSTACLE_Y)

            # Assert
            expect(grid.grid_array[OBSTACLE_Y][OBSTACLE_X]).to eq(Grid::OBSTACLE)
        end

        it "will add a sky-high obstacle" do
            # Arrange
            OBSTACLE_X = 2
            OBSTACLE_Y = 2
            grid = described_class.new(5, 5)

            # Act
            grid.add_sky_high_obstacle(OBSTACLE_X, OBSTACLE_Y)

            # Assert
            expect(grid.grid_array[OBSTACLE_Y][OBSTACLE_X]).to eq(Grid::SKY_HIGH_OBSTACLE)
        end

        it "will indicate when an obstacle is present" do
            # Arrange
            OBSTACLE_X = 2
            OBSTACLE_Y = 3
            grid = described_class.new(5, 5)
            grid.add_obstacle(OBSTACLE_X, OBSTACLE_Y)

            # Act
            result = grid.contains_obstacle?(OBSTACLE_X, OBSTACLE_Y)

            # Assert
            expect(result).to eq(true)
        end

        it "will count a Mars Rover as an obstacle" do
            # Arrange
            ROVER_X = 2
            ROVER_Y = 3
            grid = described_class.new(5, 5)
            mars_rover = Rover360.new("TST")
            mars_rover.start(ROVER_X, ROVER_Y, StraightLineRover::SOUTH)
            grid.update(mars_rover)

            # Act
            result = grid.contains_obstacle?(ROVER_X, ROVER_Y)

            # Assert
            expect(result).to eq(true)
        end

        it "will maintain obstacles when updating the display" do
            # Arrange
            OBSTACLE_X = 2
            OBSTACLE_Y = 3
            grid = described_class.new(5, 5)
            grid.add_obstacle(OBSTACLE_X, OBSTACLE_Y)
            mars_rover = Rover360.new("TST")
            mars_rover.start(OBSTACLE_X + 1, OBSTACLE_Y + 1, StraightLineRover::SOUTH)            

            # Act
            grid.update(mars_rover)

            # Assert
            expect(grid.grid_array[OBSTACLE_Y][OBSTACLE_X]).to eq(Grid::OBSTACLE)  
        end

        xit "will maintain other rovers when updating the display" do
            # Arrange
            ROVER1_X = 1
            ROVER1_Y = 1
            grid = described_class.new(5, 5)
            mars_rover1 = Rover360.new("TS1")
            mars_rover1.start(ROVER1_X, ROVER1_Y, StraightLineRover::SOUTH)
            grid.update(mars_rover1)
            mars_rover2 = Rover360.new("TS1")
            mars_rover2.start(ROVER1_X + 1, ROVER1_Y + 1, StraightLineRover::NORTH)

            # Act
            grid.update(mars_rover2)

            # Assert
            expect(grid.grid_array[ROVER1_Y][ROVER1_X]).to eq(mars_rover1)  
        end
    end
end