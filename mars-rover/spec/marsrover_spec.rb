require_relative '../lib/marsrover'

describe "MarsRover" do
    context "#initialize" do
        it "sets position and direction according to data passed in" do
            # Arrange 
            EXPECTED_X = 4
            EXPECTED_Y = 5
            EXPECTED_DIRECTION = "E"
            
            # Act
            mars_rover = MarsRover.new(EXPECTED_X, EXPECTED_Y, EXPECTED_DIRECTION)

            # Assert
            expect(mars_rover.x).to eq(EXPECTED_X)
            expect(mars_rover.y).to eq(EXPECTED_Y)
            expect(mars_rover.direction).to eq(EXPECTED_DIRECTION)
        end
    end
    
    context "#move" do
        it "changes position and direction according to data passed in" do
            # Arrange 
            EXPECTED_X = 4
            EXPECTED_Y = 5
            EXPECTED_DIRECTION = "E"
            INITIAL_DIRECTION = "W"
            mars_rover = MarsRover.new(EXPECTED_X-1, EXPECTED_Y-1, INITIAL_DIRECTION)
            
            # Act
            mars_rover.move(EXPECTED_X, EXPECTED_Y, EXPECTED_DIRECTION)

            # Assert
            expect(mars_rover.x).to eq(EXPECTED_X)
            expect(mars_rover.y).to eq(EXPECTED_Y)
            expect(mars_rover.direction).to eq(EXPECTED_DIRECTION)
        end
    end
end


