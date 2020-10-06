require_relative '../lib/presenter'
require_relative '../lib/grid'

describe Presenter do
    context "#show_display" do
        it "converts an empty 5x5 grid into a beautiful display" do
            # Arrange
            presenter = Presenter.new
            grid = Grid.new(5, 5)
            EMPTY_GRID = "This is what we think an empty 5x5 grid will look like."

            # Act/Assert
            expect{presenter.show_display(grid)}.to output(EMPTY_GRID).to_stdout
        end

        it "converts a 5x5 grid containing a Mars Rover into an informative display" do
            # Arrange
            presenter = Presenter.new
            grid = Grid.new(5, 5)
            POPULATED_GRID = "This is what we think a 5x5 grid containing a Mars Rover will look like."

            # Act/Assert
            expect{presenter.show_display(grid)}.to output(POPULATED_GRID).to_stdout
        end
    end
    
    context "#get_input" do
        it "outputs the specified input prompt" do
            # Arrange
            presenter = Presenter.new
            EXPECTED_INPUT_PROMPT = "Give me some input pretty pls"

            # Act/Assert
            expect{presenter.get_input(EXPECTED_INPUT_PROMPT)}.to output(EXPECTED_INPUT_PROMPT).to_stdout
        end
        
        it "returns stdin" do
            # Arrange
            presenter = Presenter.new
            EXPECTED_INPUT = "Here's my input thx bye"
            stub gets(EXPECTED_INPUT) 

            # Act
            user_input = presenter.get_input("Give me input pls")

            # Assert
            expect(user_input).to eq(EXPECTED_INPUT)
        end
    end
end