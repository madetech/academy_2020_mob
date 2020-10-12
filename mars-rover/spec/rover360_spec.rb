require_relative '../lib/rover360'

describe "Rover360" do
    context "#start" do
        xit "sets position and direction according to data passed in" do
            # Arrange 
            EXPECTED_X = 4
            EXPECTED_Y = 5
            EXPECTED_DIRECTION = StraightLineRover.EAST
            mars_rover = described_class.new
            
            # Act
            mars_rover.start(EXPECTED_X, EXPECTED_Y, EXPECTED_DIRECTION)

            # Assert
            expect(mars_rover.x).to eq(EXPECTED_X)
            expect(mars_rover.y).to eq(EXPECTED_Y)
            expect(mars_rover.direction).to eq(EXPECTED_DIRECTION)
        end
    end

    context "#move" do
        simple_directions = [[StraightLineRover.FORWARD, StraightLineRover.NORTH], 
                            [StraightLineRover.BACKWARD, StraightLineRover.SOUTH]]

        directions.each do |movement, expected_direction|
            xit "will not change direction given input '#{movement}'" do
                # Arrange 
                mars_rover = described_class.new
                mars_rover.start(0, 0, expected_direction)        
                grid_stub = double('Grid')
                
                # Act
                mars_rover.move(movement, grid_stub)

                # Assert
                expect(mars_rover.direction).to eq(expected_direction)
            end
        end

        all_directions = [[StraightLineRover.FORWARD, StraightLineRover.NORTH, {:x=>0,:y=>0}, {:x=>0,:y=>1}], 
                          [StraightLineRover.FORWARD, StraightLineRover.EAST, {:x=>0,:y=>0}, {:x=>1,:y=>0}], 
                          [StraightLineRover.FORWARD, StraightLineRover.SOUTH, {:x=>4,:y=>4}, {:x=>4,:y=>3}], 
                          [StraightLineRover.FORWARD, StraightLineRover.WEST, {:x=>4,:y=>4}, {:x=>3,:y=>4}],
                          [StraightLineRover.BACKWARD, StraightLineRover.NORTH, {:x=>4,:y=>4}, {:x=>4,:y=>3}], 
                          [StraightLineRover.BACKWARD, StraightLineRover.EAST, {:x=>4,:y=>4}, {:x=>3,:y=>4}], 
                          [StraightLineRover.BACKWARD, StraightLineRover.SOUTH, {:x=>0,:y=>0}, {:x=>0,:y=>1}], 
                          [StraightLineRover.BACKWARD, StraightLineRover.WEST, {:x=>0,:y=>0}, {:x=>1,:y=>0}]]

        all_directions.each do |movement, direction, start_pos, expected_pos|
            xit "will move up one square given input '#{movement}' and direction '#{direction}'" do
                # Arrange 
                mars_rover = described_class.new
                mars_rover.start(start_pos[:x], start_pos[:y], direction)        
                grid_stub = double('Grid')
                
                # Act
                mars_rover.move(movement, grid_stub)

                # Assert
                expect(mars_rover.x).to eq(expected_pos[:x])
                expect(mars_rover.y).to eq(expected_pos[:y])
            end
        end

        simple_turns = [StraightLineRover.LEFT, StraightLineRover.RIGHT]

        simple_turns.each do |turn|
            xit "will not change position given input '#{turn}'" do
                # Arrange 
                START_X = 0
                START_Y = 0
                mars_rover = described_class.new
                mars_rover.start(START_X, START_Y, StraightLineRover.NORTH)
                
                # Act
                mars_rover.turn(turn)

                # Assert
                expect(mars_rover.x).to eq(START_X)
                expect(mars_rover.y).to eq(START_Y)
            end
        end

        all_turns =[[StraightLineRover.LEFT, StraightLineRover.NORTH, StraightLineRover.WEST], 
                    [StraightLineRover.LEFT, StraightLineRover.EAST,  StraightLineRover.NORTH], 
                    [StraightLineRover.LEFT, StraightLineRover.SOUTH, StraightLineRover.EAST], 
                    [StraightLineRover.LEFT, StraightLineRover.WEST,  StraightLineRover.SOUTH],
                    [StraightLineRover.RIGHT, StraightLineRover.NORTH,StraightLineRover.EAST], 
                    [StraightLineRover.RIGHT, StraightLineRover.EAST, StraightLineRover.SOUTH], 
                    [StraightLineRover.RIGHT, StraightLineRover.SOUTH,StraightLineRover.WEST], 
                    [StraightLineRover.RIGHT, StraightLineRover.WEST, StraightLineRover.NORTH]]

        all_turns.each do |movement, direction, expected_direction|
            xit "will change direction to '#{expected_direction}' given input '#{movement}' and direction '#{direction}'" do
                # Arrange 
                mars_rover = described_class.new
                mars_rover.start(0, 0, direction)
                
                # Act
                mars_rover.turn(movement)

                # Assert
                expect(mars_rover.direction).to eq(expected_direction)
            end
        end

        all_ways_off_the_edge =[[StraightLineRover.FORWARD, StraightLineRover.NORTH, {:x=>4,:y=>4}, {:x=>4,:y=>0}], 
                                [StraightLineRover.FORWARD, StraightLineRover.EAST,  {:x=>4,:y=>4}, {:x=>0,:y=>4}], 
                                [StraightLineRover.FORWARD, StraightLineRover.SOUTH, {:x=>0,:y=>0}, {:x=>0,:y=>4}], 
                                [StraightLineRover.FORWARD, StraightLineRover.WEST,  {:x=>0,:y=>0}, {:x=>4,:y=>0}],
                                [StraightLineRover.BACKWARD, StraightLineRover.NORTH, {:x=>0,:y=>0}, {:x=>0,:y=>4}], 
                                [StraightLineRover.BACKWARD, StraightLineRover.EAST,  {:x=>0,:y=>0}, {:x=>4,:y=>0}], 
                                [StraightLineRover.BACKWARD, StraightLineRover.SOUTH, {:x=>4,:y=>4}, {:x=>4,:y=>0}], 
                                [StraightLineRover.BACKWARD, StraightLineRover.WEST,  {:x=>4,:y=>4}, {:x=>0,:y=>4}]]

        all_ways_off_the_edge.each do |movement, direction, start_pos, expected_pos|
            xit "will move up one square given input '#{movement}' and direction '#{direction}'" do
                # Arrange 
                mars_rover = described_class.new
                mars_rover.start(start_pos[:x], start_pos[:y], direction)        
                grid_stub = double('Grid')
                
                # Act
                mars_rover.move(movement, grid_stub)

                # Assert
                expect(mars_rover.x).to eq(expected_pos[:x])
                expect(mars_rover.y).to eq(expected_pos[:y])
            end
        end
        
        all_ways_off_the_edge.each do |movement, direction, start_pos, expected_pos|
            xit "will raise an exception if there is an obstacle over the edge, given input '#{movement}' and direction '#{direction}'" do
                # Arrange 
                mars_rover = described_class.new
                mars_rover.start(start_pos[:x], start_pos[:y], direction)          
                fake_grid = double('Grid')
                allow(fake_grid).to receive(contains_obstacle?).with(expected_pos[:x], expected_pos[:y]).and_return(true)               

                # Act & Assert
                expect{mars_rover.move(movement, fake_grid)}.to raise_exception
            end
        end
        
        all_directions.each do |movement, direction, start_pos, expected_pos|
            xit "will raise an exception if there is an obstacle in the way, given input '#{movement}' and direction '#{direction}'" do
                # Arrange 
                mars_rover = described_class.new
                mars_rover.start(start_pos[:x], start_pos[:y], direction)          
                fake_grid = double('Grid')
                allow(fake_grid).to receive(contains_obstacle?).with(expected_pos[:x], expected_pos[:y]).and_return(true)

                # Act & Assert
                expect{mars_rover.move(movement, fake_grid)}.to raise_exception
            end
        end
    end
end


