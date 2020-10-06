require_relative '../lib/marsroverapp'

describe MarsRoverApp do
    context "#start" do
        it "displays an empty 5x5 grid on startup" do
            # Arrange
            marsroverapp = MarsRoverApp.new
            EMPTY_GRID = "This is what we think an empty 5x5 grid will look like."

            # Act/Assert
            expect{marsroverapp.start}.std_output.to include(EMPTY_GRID)
        end

        it "prompts the user to input coordinates and direction on startup" do
            # Arrange
            marsroverapp = MarsRoverApp.new
            input_prompt = marsroverapp.REQUEST_FOR_INPUT

            # Act/Assert
            expect{marsroverapp.start}.std_output.to include(input_prompt)
        end
    end
end