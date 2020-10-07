require_relative '../lib/marsroverapp'

describe MarsRoverApp do
    context "on startup" do
        before(:each) do
            @presenter = Presenter.new
            @grid = Grid.new(5, 5)
            @mars_rover = MarsRover.new
        end

        it "displays an empty 5x5 grid on startup" do
            # Arrange
            marsroverapp = MarsRoverApp.new            
            EMPTY_GRID = "This is what we think an empty 5x5 grid will look like."

            # Act/Assert
            expect{marsroverapp.start(@presenter, @grid, @mars_rover)}.std_output.to include(EMPTY_GRID)
        end

        it "prompts the user to input coordinates and direction on startup" do
            # Arrange
            marsroverapp = MarsRoverApp.new
            expected_prompt = marsroverapp.REQUEST_FOR_FIRST_INPUT

            # Act/Assert
            expect{marsroverapp.start(@presenter, @grid, @mars_rover)}.std_output.to include(expected_prompt)
        end
    end

    context "when moving (using test doubles)" do
        it "displays the position of a Rover when given position" do
            # Arrange
            marsroverapp = MarsRoverApp.new
            GRID_WITH_NEW_ROVER = "This is what we think a 5x5 grid with a North-facing Rover at 0,0 will look like."
            mars_rover_stub = MarsRover.stub
            grid_stub = Grid.stub
            fake_presenter = Presenter.fake(show_display(grid_stub) => puts GRID_WITH_NEW_ROVER)
            EXPECTED_INPUT = "0,0,N"
            stub gets(EXPECTED_INPUT) 

            # Act/Assert
            expect{marsroverapp.start(fake_presenter, grid_stub, mars_rover_stub)}.std_output.to have_as_last_output(GRID_WITH_NEW_ROVER)
        end
    end

    context "when moving (using test spies)" do
        it "uses the rover, the grid and the presenter to update the Rover's position" do
            # Arrange
            marsroverapp = MarsRoverApp.new
            GRID_WITH_NEW_ROVER = "This is what we think a 5x5 grid with a North-facing Rover at 0,0 will look like."
            mars_rover_spy = MarsRover.spy
            grid_spy = Grid.spy
            presenter_spy = Presenter.spy(show_display(grid_spy) => puts GRID_WITH_NEW_ROVER)
            EXPECTED_INPUT = "0,0,N"
            stub gets(EXPECTED_INPUT) 

            # Act/Assert
            expect{marsroverapp.start(presenter_spy, grid_spy, mars_rover_spy)}.std_output.to have_as_last_output(GRID_WITH_NEW_ROVER)
            expect(mars_rover_spy.x).to be_called
            expect(mars_rover_spy.y).to be_called
            expect(mars_rover_spy.direction).to be_called
            expect(grid_spy.update).to be_called with(mars_rover_spy)
            expect(presenter_spy.show_display).to be_called with(grid_spy)
        end
    end

    context "when moving (proper end to end test)" do
        it "displays the position of a Rover when given position" do
            # Arrange
            marsroverapp = MarsRoverApp.new
            EXPECTED_INPUT = "0,0,N"
            stub gets(EXPECTED_INPUT) 
            GRID_WITH_NEW_ROVER = "This is what we think a 5x5 grid with a North-facing Rover at 0,0 will look like."

            # Act/Assert
            expect{marsroverapp.start(@presenter, @grid, @mars_rover)}.std_output.to have_as_last_output(GRID_WITH_NEW_ROVER)
        end

        it "prompts the user to input movement or new direction after first input" do
            # Arrange
            marsroverapp = MarsRoverApp.new
            stub gets(EXPECTED_INPUT) 
            expected_prompt = marsroverapp.REQUEST_FOR_FURTHER_INPUT

            # Act/Assert
            expect{marsroverapp.start(@presenter, @grid, @mars_rover)}.std_output.to have_as_last_output(expected_prompt)
        end
        
        it "updates the position of a Rover when it moves forwards" do
            # Arrange
            marsroverapp = MarsRoverApp.new
            INITIAL_INPUT = "0,0,N"
            EXPECTED_MOVE_INPUT = "f"
            stub gets(INITIAL_INPUT, EXPECTED_MOVE_INPUT) 
            GRID_WITH_NEW_ROVER = "A 5x5 grid with North-facing Rover moved forward one square from 0,0"

            # Act/Assert
            expect{marsroverapp.start(@presenter, @grid, @mars_rover)}.std_output.to have_as_last_output(GRID_WITH_NEW_ROVER)
        end
        
        it "updates the position of a Rover when it moves backwards" do
            # Arrange
            marsroverapp = MarsRoverApp.new
            INITIAL_INPUT = "4,4,S"
            EXPECTED_MOVE_INPUT = "b"
            stub gets(INITIAL_INPUT, EXPECTED_MOVE_INPUT) 
            GRID_WITH_NEW_ROVER = "A 5x5 grid with South-facing Rover moved backward one square from 4,4"

            # Act/Assert
            expect{marsroverapp.start(@presenter, @grid, @mars_rover)}.std_output.to have_as_last_output(GRID_WITH_NEW_ROVER)
        end
    end
end