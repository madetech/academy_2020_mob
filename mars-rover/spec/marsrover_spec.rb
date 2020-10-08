require_relative '../lib/marsrover'

describe "MarsRover" do
    context "#start" do
        it "sets position and direction according to data passed in" do
            # Arrange 
            EXPECTED_X = 4
            EXPECTED_Y = 5
            EXPECTED_DIRECTION = MarsRover.EAST
            mars_rover = MarsRover.new
            
            # Act
            mars_rover.start(EXPECTED_X, EXPECTED_Y, EXPECTED_DIRECTION)

            # Assert
            expect(mars_rover.x).to eq(EXPECTED_X)
            expect(mars_rover.y).to eq(EXPECTED_Y)
            expect(mars_rover.direction).to eq(EXPECTED_DIRECTION)
        end
    end

    context "#move" do
        simple_directions = [[MarsRover.FORWARD, MarsRover.NORTH], 
                            [MarsRover.BACKWARD, MarsRover.SOUTH]]

        directions.each do |movement, expected_direction|
            it "will not change direction given input '#{movement}'" do
                # Arrange 
                mars_rover = MarsRover.new
                mars_rover.start(0, 0, expected_direction)        
                grid_stub = double('Grid')
                
                # Act
                mars_rover.move(movement, grid_stub)

                # Assert
                expect(mars_rover.direction).to eq(expected_direction)
            end
        end

        all_directions = [[MarsRover.FORWARD, MarsRover.NORTH, {:x=>0,:y=>0}, {:x=>0,:y=>1}], 
                          [MarsRover.FORWARD, MarsRover.EAST, {:x=>0,:y=>0}, {:x=>1,:y=>0}], 
                          [MarsRover.FORWARD, MarsRover.SOUTH, {:x=>4,:y=>4}, {:x=>4,:y=>3}], 
                          [MarsRover.FORWARD, MarsRover.WEST, {:x=>4,:y=>4}, {:x=>3,:y=>4}],
                          [MarsRover.BACKWARD, MarsRover.NORTH, {:x=>4,:y=>4}, {:x=>4,:y=>3}], 
                          [MarsRover.BACKWARD, MarsRover.EAST, {:x=>4,:y=>4}, {:x=>3,:y=>4}], 
                          [MarsRover.BACKWARD, MarsRover.SOUTH, {:x=>0,:y=>0}, {:x=>0,:y=>1}], 
                          [MarsRover.BACKWARD, MarsRover.WEST, {:x=>0,:y=>0}, {:x=>1,:y=>0}]]

        all_directions.each do |movement, direction, start_pos, expected_pos|
            it "will move up one square given input '#{movement}' and direction '#{direction}'" do
                # Arrange 
                mars_rover = MarsRover.new
                mars_rover.start(start_pos[:x], start_pos[:y], direction)        
                grid_stub = double('Grid')
                
                # Act
                mars_rover.move(movement, grid_stub)

                # Assert
                expect(mars_rover.x).to eq(expected_pos[:x])
                expect(mars_rover.y).to eq(expected_pos[:y])
            end
        end

        simple_turns = [MarsRover.LEFT, MarsRover.RIGHT]

        simple_turns.each do |turn|
            it "will not change position given input '#{turn}'" do
                # Arrange 
                START_X = 0
                START_Y = 0
                mars_rover = MarsRover.new
                mars_rover.start(START_X, START_Y, MarsRover.NORTH)
                
                # Act
                mars_rover.turn(turn)

                # Assert
                expect(mars_rover.x).to eq(START_X)
                expect(mars_rover.y).to eq(START_Y)
            end
        end

        all_turns =[[MarsRover.LEFT, MarsRover.NORTH, MarsRover.WEST], 
                    [MarsRover.LEFT, MarsRover.EAST,  MarsRover.NORTH], 
                    [MarsRover.LEFT, MarsRover.SOUTH, MarsRover.EAST], 
                    [MarsRover.LEFT, MarsRover.WEST,  MarsRover.SOUTH],
                    [MarsRover.RIGHT, MarsRover.NORTH,MarsRover.EAST], 
                    [MarsRover.RIGHT, MarsRover.EAST, MarsRover.SOUTH], 
                    [MarsRover.RIGHT, MarsRover.SOUTH,MarsRover.WEST], 
                    [MarsRover.RIGHT, MarsRover.WEST, MarsRover.NORTH]]

        all_turns.each do |movement, direction, expected_direction|
            it "will change direction to '#{expected_direction}' given input '#{movement}' and direction '#{direction}'" do
                # Arrange 
                mars_rover = MarsRover.new
                mars_rover.start(0, 0, direction)
                
                # Act
                mars_rover.turn(movement)

                # Assert
                expect(mars_rover.direction).to eq(expected_direction)
            end
        end

        all_ways_off_the_edge =[[MarsRover.FORWARD, MarsRover.NORTH, {:x=>4,:y=>4}, {:x=>4,:y=>0}], 
                                [MarsRover.FORWARD, MarsRover.EAST,  {:x=>4,:y=>4}, {:x=>0,:y=>4}], 
                                [MarsRover.FORWARD, MarsRover.SOUTH, {:x=>0,:y=>0}, {:x=>0,:y=>4}], 
                                [MarsRover.FORWARD, MarsRover.WEST,  {:x=>0,:y=>0}, {:x=>4,:y=>0}],
                                [MarsRover.BACKWARD, MarsRover.NORTH, {:x=>0,:y=>0}, {:x=>0,:y=>4}], 
                                [MarsRover.BACKWARD, MarsRover.EAST,  {:x=>0,:y=>0}, {:x=>4,:y=>0}], 
                                [MarsRover.BACKWARD, MarsRover.SOUTH, {:x=>4,:y=>4}, {:x=>4,:y=>0}], 
                                [MarsRover.BACKWARD, MarsRover.WEST,  {:x=>4,:y=>4}, {:x=>0,:y=>4}]]

        all_ways_off_the_edge.each do |movement, direction, start_pos, expected_pos|
            it "will move up one square given input '#{movement}' and direction '#{direction}'" do
                # Arrange 
                mars_rover = MarsRover.new
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
            it "will raise an exception if there is an obstacle over the edge, given input '#{movement}' and direction '#{direction}'" do
                # Arrange 
                mars_rover = MarsRover.new
                mars_rover.start(start_pos[:x], start_pos[:y], direction)          
                fake_grid = double('Grid')
                allow(fake_grid).to receive(contains_obstacle?(expected_pos[:x], expected_pos[:y])).and_return(true)               

                # Act & Assert
                expect{mars_rover.move(movement, fake_grid)}.to raise_exception
            end
        end
        
        all_directions.each do |movement, direction, start_pos, expected_pos|
            it "will raise an exception if there is an obstacle in the way, given input '#{movement}' and direction '#{direction}'" do
                # Arrange 
                mars_rover = MarsRover.new
                mars_rover.start(start_pos[:x], start_pos[:y], direction)          
                fake_grid = double('Grid')
                allow(fake_grid).to receive(contains_obstacle?(expected_pos[:x], expected_pos[:y])).and_return(true)

                # Act & Assert
                expect{mars_rover.move(movement, fake_grid)}.to raise_exception
            end
        end
    end
end


