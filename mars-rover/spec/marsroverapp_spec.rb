require_relative '../lib/marsroverapp'

describe MarsRoverApp do
    context "on startup" do
        it "displays an empty 5x5 grid on startup" do
            # Arrange
            marsroverapp = MarsRoverApp.new
            presenter = Presenter.new
            grid = Grid.new(5, 5)
            mars_rover = MarsRover.new
            EMPTY_GRID = "This is what we think an empty 5x5 grid will look like."

            # Act/Assert
            expect{marsroverapp.start(presenter, grid, mars_rover)}.std_output.to include(EMPTY_GRID)
        end

        it "prompts the user to input coordinates and direction on startup" do
            # Arrange
            marsroverapp = MarsRoverApp.new
            input_prompt = marsroverapp.REQUEST_FOR_INPUT
            presenter = Presenter.new
            grid = Grid.new(5, 5)
            mars_rover = MarsRover.new

            # Act/Assert
            expect{marsroverapp.start(presenter, grid, mars_rover)}.std_output.to include(input_prompt)
        end
    end

    context "when moving (proper end to end test)" do
        it "displays the position of a Rover when given position" do
            # Arrange
            marsroverapp = MarsRoverApp.new
            presenter = Presenter.new
            grid = Grid.new(5, 5)
            mars_rover = MarsRover.new
            EXPECTED_INPUT = "0, 0, N"
            stub gets(EXPECTED_INPUT) 
            GRID_WITH_NEW_ROVER = "This is what we think a 5x5 grid with a North-facing Rover at 0,0 will look like."

            # Act/Assert
            expect{marsroverapp.start(presenter, grid, mars_rover)}.std_output.to have_as_last_output(GRID_WITH_NEW_ROVER)
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
            EXPECTED_INPUT = "0, 0, N"
            stub gets(EXPECTED_INPUT) 

            # Act/Assert
            expect{marsroverapp.start(fake_presenter, grid_stub, mars_rover_stub)}.std_output.to have_as_last_output(GRID_WITH_NEW_ROVER)
        end
    end
end