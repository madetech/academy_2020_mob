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
                START_X = 0
                START_Y = 0
                mars_rover = MarsRover.new
                mars_rover.start(START_X, START_Y, expected_direction)
                
                # Act
                mars_rover.move(movement)

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
                
                # Act
                mars_rover.move(movement)

                # Assert
                expect(mars_rover.x).to eq(expected_pos[:x])
                expect(mars_rover.y).to eq(expected_pos[:y])
            end
        end
    end
end


