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

        it "converts a 5x5 grid (containing a Mars Rover facing North) into an informative display" do
            # Arrange
            presenter = Presenter.new
            fake_grid = make_fake_grid(1, 1, MarsRover.NORTH)
            POPULATED_GRID = "This is what we think a 5x5 grid containing a Mars Rover facing North will look like."

            # Act/Assert
            expect{presenter.show_display(fake_grid)}.to output(POPULATED_GRID).to_stdout
        end

        it "converts a 5x5 grid (containing a Mars Rover facing South) into an informative display" do
            # Arrange
            presenter = Presenter.new
            fake_grid = make_fake_grid(2, 3, MarsRover.SOUTH)
            POPULATED_GRID = "This is what we think a 5x5 grid containing a Mars Rover facing South will look like."

            # Act/Assert
            expect{presenter.show_display(fake_grid)}.to output(POPULATED_GRID).to_stdout
        end

        it "converts a 5x5 grid (containing a Mars Rover facing East) into an informative display" do
            # Arrange
            presenter = Presenter.new
            fake_grid = make_fake_grid(4, 2, MarsRover.EAST)
            POPULATED_GRID = "This is what we think a 5x5 grid containing a Mars Rover facing East will look like."

            # Act/Assert
            expect{presenter.show_display(fake_grid)}.to output(POPULATED_GRID).to_stdout
        end

        it "converts a 5x5 grid (containing a Mars Rover facing West) into an informative display" do
            # Arrange
            presenter = Presenter.new
            fake_grid = make_fake_grid(0, 4, MarsRover.WEST)
            POPULATED_GRID = "This is what we think a 5x5 grid containing a Mars Rover facing West will look like."

            # Act/Assert
            expect{presenter.show_display(fake_grid)}.to output(POPULATED_GRID).to_stdout
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

        bad_inputs = ["!", "*"] # plus a lot more examples of bad input
        
        bad_inputs.each do |bad_input|
            it "raises an exception when input is invalid: '#{bad_input}'" do
                # Arrange
                presenter = Presenter.new
                stub gets(bad_input) 
    
                # Act & Assert
                expect{presenter.get_input("Give me input pls")}.to raise_exception
            end
        end
    end

    private

    def make_real_grid(x, y, direction)
        mars_rover = MarsRover.new
        mars_rover.start(x, y, direction)
        grid = Grid.new(5, 5)
        grid.update(mars_rover)
    end

    def make_fake_grid(x, y, direction)  
        fake_grid = double('Grid')
        allow(grid).to receive(:grid_array) { make_fake_grid_array(x, y, direction) } 
        fake_grid
    end

    def make_fake_grid_array(x, y, direction)        
        # Build a fake 5x5 grid array with a Mars Rover at the specified position and facing the specified direction
    end
end