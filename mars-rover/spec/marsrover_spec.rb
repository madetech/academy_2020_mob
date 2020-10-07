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
        it "will not change direction given input 'f'" do
            # Arrange 
            START_X = 0
            START_Y = 0
            DIRECTION = MarsRover.NORTH
            mars_rover = MarsRover.new
            mars_rover.start(START_X, START_Y, DIRECTION)
            
            # Act
            mars_rover.move(MarsRover.FORWARD)

            # Assert
            expect(mars_rover.direction).to eq(DIRECTION)
        end

        it "will move up one square given input 'f' and direction N" do
            # Arrange 
            START_X = 0
            START_Y = 0
            DIRECTION = MarsRover.NORTH
            mars_rover = MarsRover.new
            mars_rover.start(START_X, START_Y, DIRECTION)
            
            # Act
            mars_rover.move(MarsRover.FORWARD)

            # Assert
            expect(mars_rover.x).to eq(START_X + 1)
            expect(mars_rover.y).to eq(START_Y)
        end

        it "will move right one square given input 'f' and direction 'E'" do
            # Arrange 
            START_X = 0
            START_Y = 0
            DIRECTION = MarsRover.EAST
            mars_rover = MarsRover.new
            mars_rover.start(START_X, START_Y, DIRECTION)
            
            # Act
            mars_rover.move(MarsRover.FORWARD)

            # Assert
            expect(mars_rover.x).to eq(START_X)
            expect(mars_rover.y).to eq(START_Y + 1)
        end
    end
end


