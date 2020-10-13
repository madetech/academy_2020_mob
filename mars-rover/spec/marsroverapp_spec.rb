require_relative '../lib/wide_screen_presenter'
require_relative '../lib/communicator'
require_relative '../lib/grid'
require_relative '../lib/mars_rover_factory'
require_relative '../lib/marsroverapp'

describe MarsRoverApp do
    context "on startup" do
        before(:each) do
            @presenter = WideScreenPresenter.new
            @communicator = Communicator.new
            @grid = Grid.new(5, 5)
            @mars_rover_factory = MarsRoverFactory.new
            @mars_rover_app = MarsRoverApp.new(@presenter, @communicator, @grid, @mars_rover_factory)
        end

        it "can display an empty 3x2 grid containing no obstacles on startup" do
            # Arrange
            presenter = WideScreenPresenter.new
            communicator = Communicator.new
            grid = Grid.new(3, 2)
            mars_rover_factory = MarsRoverFactory.new
            mars_rover_app = MarsRoverApp.new(presenter, communicator, grid, mars_rover_factory)
            INITIAL_INPUT = "ANN,360,0,0,N"
            EMPTY_GRID = 
            "-------------------\n" +
            "|     |     |     |\n" +
            "|     |     |     |\n" +
            "|     |     |     |\n" +
            "-------------------\n" +
            "|     |     |     |\n" +
            "|     |     |     |\n" +
            "|     |     |     |\n" +
            "-------------------\n"
            allow(communicator).to receive(:gets).and_return(INITIAL_INPUT, "")

            # Act/Assert
            expect{mars_rover_app.start}.to output(EMPTY_GRID).to_stdout
        end

        it "displays an empty 5x5 grid containing obstacles on startup" do
            # Arrange
            INITIAL_INPUT = "ANN,360,0,0,N"
            @grid.add_obstacle(3,2)
            @grid.add_sky_high_obstacle(2,3)          
            EMPTY_GRID = 
            "-------------------------------\n" +
            "|     |     |     |     |     |\n" +
            "|     |     |     |     |     |\n" +
            "|     |     |     |     |     |\n" +
            "-------------------------------\n" +
            "|     |     |     |     |     |\n" +
            "|     |     |     |     |     |\n" +
            "|     |     |     |     |     |\n" +
            "-------------------------------\n" +
            "|     |     |     | X X |     |\n" +
            "|     |     |     |  X  |     |\n" +
            "|     |     |     | X X |     |\n" +
            "-------------------------------\n" +
            "|     |     | SKY |     |     |\n" +
            "|     |     |  X  |     |     |\n" +
            "|     |     | HIGH|     |     |\n" +
            "-------------------------------\n" +
            "|     |     |     |     |     |\n" +
            "|     |     |     |     |     |\n" +
            "|     |     |     |     |     |\n" +
            "-------------------------------\n"
            allow(@communicator).to receive(:gets).and_return(INITIAL_INPUT, "")

            # Act/Assert
            expect{@mars_rover_app.start}.to output(EMPTY_GRID).to_stdout
        end

        xit "prompts the user to input coordinates and direction on startup" do
            # Arrange
            INITIAL_INPUT = "ANN,360,0,0,N"
            expected_prompt = MarsRoverApp::REQUEST_FOR_FIRST_INPUT
            allow(@communicator).to receive(:gets).and_return(INITIAL_INPUT, "")

            # Act/Assert
            expect{@mars_rover_app.start}.to output(expected_prompt).to_stdout
        end
    end

    context "detecting invalid input" do
        xit "shows an error when the initial input is invalid" do
            # Arrange
            BAD_INPUT = "!"
            allow(@communicator).to receive(:gets).and_return("!") 

            # Act/Assert
            expect{@mars_rover_app.start}.to output(MarsRoverApp::BAD_INPUT_ERROR).to_stdout
        end
    
        xit "shows an error when the first movement input is invalid" do
            # Arrange
            INITIAL_INPUT = "ANN,360,0,0,N"
            BAD_INPUT = "*"
            allow(@communicator).to receive(:gets).and_return(INITIAL_INPUT, BAD_INPUT, "")

            # Act/Assert
            expect{@mars_rover_app.start}.to output(MarsRoverApp::BAD_INPUT_ERROR).to_stdout
        end
    
        xit "shows an error when a later movement input is invalid" do
            # Arrange
            INITIAL_INPUT = "ANN,360,0,0,N"
            BAD_INPUT = ",,,"
            allow(@communicator).to receive(:gets).and_return(INITIAL_INPUT, "f", "r", "l", BAD_INPUT, "") 

            # Act/Assert
            expect{@mars_rover_app.start}.to output(MarsRoverApp::BAD_INPUT_ERROR).to_stdout
        end
    end

    context "when moving (using test doubles)" do
        xit "displays the position of a Rover when given position" do
            # Arrange
            GRID_WITH_NEW_ROVER = "This is what we think a 5x5 grid with a North-facing Rover at 0,0 will look like."
            rover_factory_stub = double('MarsRoverFactory')
            grid_stub = double('Grid')
            communicator_stub = double('Communicator')
            fake_presenter = double('Presenter')
            allow(fake_presenter).to receive(:show_display).with(grid_stub) {puts GRID_WITH_NEW_ROVER}
            EXPECTED_INPUT = "ANN,360,0,0,N"
            allow(@communicator).to receive(:gets).and_return(EXPECTED_INPUT) 
            mars_rover_app = MarsRoverApp.new(fake_presenter, communicator_stub, grid_stub, rover_factory_stub)

            # Act/Assert
            expect{mars_rover_app.start}.to output(GRID_WITH_NEW_ROVER).to_stdout
        end
    end

    context "when moving (using test spies)" do
        xit "uses the rover, the grid and the presenter to update the Rover's position" do
            # Arrange
            GRID_WITH_NEW_ROVER = "This is what we think a 5x5 grid with a North-facing Rover at 0,0 will look like."
            mars_rover_spy = spy('Rover360')
            rover_factory_fake = double('MarsRoverFactory')
            allow(rover_factory_fake).to receive(:generate_rover).and_return(mars_rover_spy)
            grid_spy = spy('Grid')
            communicator_stub = double('Communicator')
            presenter_spy = spy('Presenter')
            allow(presenter_spy).to receive(:show_display).with(grid_spy) {puts GRID_WITH_NEW_ROVER}
            EXPECTED_INPUT = "ANN,360,0,0,N"
            allow(@communicator).to receive(:gets).and_return(EXPECTED_INPUT) 
            mars_rover_app = MarsRoverApp.new(presenter_spy, communicator_stub, grid_spy, rover_factory_fake)

            # Act/Assert
            expect{mars_rover_app.start}.to output(GRID_WITH_NEW_ROVER).to_stdout
            expect(mars_rover_spy).to have_received(:x)
            expect(mars_rover_spy).to have_received(:y)
            expect(mars_rover_spy).to have_received(:direction)
            expect(grid_spy).to have_received(:update).with(mars_rover_spy)
            expect(presenter_spy).to have_received(:show_display).with(grid_spy)
        end
    end

    context "when moving (proper end to end test)" do
        xit "displays the position of a Rover when given position" do
            # Arrange
            EXPECTED_INPUT = "ANN,360,0,0,N"
            allow(@communicator).to receive(:gets).and_return(EXPECTED_INPUT) 
            GRID_WITH_NEW_ROVER = "This is what we think a 5x5 grid with a North-facing Rover at 0,0 will look like."

            # Act/Assert
            expect{@mars_rover_app.start}.to output(GRID_WITH_NEW_ROVER).to_stdout
        end

        xit "prompts the user to input movement or new direction after first input" do
            # Arrange
            allow(@communicator).to receive(:gets).and_return(EXPECTED_INPUT) 
            expected_prompt = MarsRoverApp::REQUEST_FOR_FURTHER_INPUT

            # Act/Assert
            expect{@mars_rover_app.start}.to output(expected_prompt).to_stdout
        end
        
        xit "updates the position of a Rover when it moves forwards" do
            # Arrange
            INITIAL_INPUT = "ANN,360,0,0,N"
            EXPECTED_MOVE_INPUT = "f"
            allow(@communicator).to receive(:gets).and_return(INITIAL_INPUT, EXPECTED_MOVE_INPUT, "") 
            GRID_WITH_ROVER = "A 5x5 grid with North-facing Rover moved forward one square from 0,0"

            # Act/Assert
            expect{@mars_rover_app.start}.to output(GRID_WITH_ROVER).to_stdout
        end
        
        xit "updates the position of a Rover when it moves backwards" do
            # Arrange
            INITIAL_INPUT = "4,4,S"
            EXPECTED_MOVE_INPUT = "b"
            allow(@communicator).to receive(:gets).and_return(INITIAL_INPUT, EXPECTED_MOVE_INPUT, "") 
            GRID_WITH_ROVER = "A 5x5 grid with South-facing Rover moved backward one square from 4,4"

            # Act/Assert
            expect{@mars_rover_app.start}.to output(GRID_WITH_ROVER).to_stdout
        end
        
        xit "updates the direction of a Rover when it turns left" do
            # Arrange
            INITIAL_INPUT = "ANN,360,0,0,N"
            EXPECTED_MOVE_INPUT = "l"
            allow(@communicator).to receive(:gets).and_return(INITIAL_INPUT, EXPECTED_MOVE_INPUT, "") 
            GRID_WITH_ROVER = "A 5x5 grid with a West-facing Rover at 0,0"

            # Act/Assert
            expect{@mars_rover_app.start}.to output(GRID_WITH_ROVER).to_stdout                .std_output.to have_as_last_output(GRID_WITH_ROVER)
        end
        
        xit "updates the direction of a Rover when it turns right" do
            # Arrange
            INITIAL_INPUT = "ANN,360,0,0,N"
            EXPECTED_MOVE_INPUT = "r"
            allow(@communicator).to receive(:gets).and_return(INITIAL_INPUT, EXPECTED_MOVE_INPUT, "") 
            GRID_WITH_ROVER = "A 5x5 grid with an East-facing Rover at 0,0"

            # Act/Assert
            expect{@mars_rover_app.start}.to output(GRID_WITH_ROVER).to_stdout
        end
        
        xit "wraps around when it moves forward off the edge of the grid" do
            # Arrange
            INITIAL_INPUT = "0,0,S"
            EXPECTED_MOVE_INPUT = "f"
            allow(@communicator).to receive(:gets).and_return(INITIAL_INPUT, EXPECTED_MOVE_INPUT, "") 
            GRID_WITH_ROVER = "A 5x5 grid with a South-facing Rover at 0,4"

            # Act/Assert
            expect{@mars_rover_app.start}.to output(GRID_WITH_ROVER).to_stdout
        end
        
        xit "wraps around when it moves backwards off the edge of the grid" do
            # Arrange
            INITIAL_INPUT = "4,4,S"
            EXPECTED_MOVE_INPUT = "b"
            allow(@communicator).to receive(:gets).and_return(INITIAL_INPUT, EXPECTED_MOVE_INPUT, "") 
            GRID_WITH_ROVER = "A 5x5 grid with a South-facing Rover at 4,0"

            # Act/Assert
            expect{@mars_rover_app.start}.to output(GRID_WITH_ROVER).to_stdout
        end
        
        xit "responds to repeated movement inputs" do
            # Arrange
            INITIAL_INPUT = "ANN,360,0,0,N"
            allow(@communicator).to receive(:gets).and_return("ANN,360,0,0,N", "f", "r", "f", "f", "l", "b") 
            GRID_WITH_ROVER = "A 5x5 grid with a North-facing Rover at 2,0"

            # Act/Assert
            expect{@mars_rover_app.start}.to output(GRID_WITH_ROVER).to_stdout
        end
        
        xit "responds to several movements in one input" do
            # Arrange
            INITIAL_INPUT = "ANN,360,0,0,N"
            allow(@communicator).to receive(:gets).and_return("ANN,360,0,0,N", "f,r,f,f,l,b") 
            GRID_WITH_ROVER = "A 5x5 grid with a North-facing Rover at 2,0"

            # Act/Assert
            expect{@mars_rover_app.start}.to output(GRID_WITH_ROVER).to_stdout
        end
        
        xit "shows an error when the rover can't move forward because there is an obstacle in the way" do
            # Arrange
            INITIAL_INPUT = "ANN,360,0,0,N"
            EXPECTED_MOVE_INPUT = "f"
            @grid.add_obstacle(0,1)
            allow(@communicator).to receive(:gets).and_return(INITIAL_INPUT, EXPECTED_MOVE_INPUT, "") 

            # Act/Assert
            expect{@mars_rover_app.start}.to output(MarsRoverApp::OBSTACLE_ERROR).to_stdout
        end
        
        xit "shows an error when the rover can't move backwards because there is an obstacle in the way" do
            # Arrange
            INITIAL_INPUT = "4,4,N"
            EXPECTED_MOVE_INPUT = "b"
            @grid.add_obstacle(4,3)
            allow(@communicator).to receive(:gets).and_return(INITIAL_INPUT, EXPECTED_MOVE_INPUT, "") 

            # Act/Assert
            expect{@mars_rover_app.start}.to output(MarsRoverApp::OBSTACLE_ERROR).to_stdout
        end
    end
end