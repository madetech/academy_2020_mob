require_relative '../lib/marsrover'

describe "MarsRover" do
    context "#start" do
        it "sets position and direction according to data passed in" do
            # Arrange 
            EXPECTED_X = 4
            EXPECTED_Y = 5
            EXPECTED_DIRECTION = "E"
            mars_rover = MarsRover.new
            
            # Act
            mars_rover.start(EXPECTED_X, EXPECTED_Y, EXPECTED_DIRECTION)

            # Assert
            expect(mars_rover.x).to eq(EXPECTED_X)
            expect(mars_rover.y).to eq(EXPECTED_Y)
            expect(mars_rover.direction).to eq(EXPECTED_DIRECTION)
        end
    end
end


