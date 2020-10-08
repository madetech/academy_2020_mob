require_relative '../lib/wide_screen_presenter'
require_relative '../lib/grid'
require 'rover_spec_helper'

describe WideScreenPresenter do
    context "#show_display" do
        it "converts an empty 5x5 grid into a beautiful display" do
            # Arrange
            presenter = described_class.new
            grid = Grid.new(5, 5)
            EMPTY_GRID = "This is what we think an empty 5x5 grid will look like (see notes.md)."

            # Act/Assert
            expect{presenter.show_display(grid)}.to output(EMPTY_GRID).to_stdout
        end

        it "converts a 5x5 grid containing obstacles and a North-facing rover into an informative display" do
            # Arrange
            presenter = described_class.new
            fake_grid = RoverSpecHelper.make_fake_grid(0, 0, StraightLineRover.NORTH, [1,1], [3,4])
            EMPTY_GRID = "This is what we think a 5x5 grid containing obstacles and a North-facing rover will look like (see notes.md)."

            # Act/Assert
            expect{presenter.show_display(fake_grid)}.to output(EMPTY_GRID).to_stdout
        end

        it "converts a 5x5 grid (containing a Mars Rover facing North) into an informative display" do
            # Arrange
            presenter = described_class.new
            fake_grid = RoverSpecHelper.make_fake_grid(1, 1, StraightLineRover.NORTH)
            POPULATED_GRID = "This is what we think a 5x5 grid containing a Mars Rover facing North will look like (see notes.md)."

            # Act/Assert
            expect{presenter.show_display(fake_grid)}.to output(POPULATED_GRID).to_stdout
        end

        it "converts a 5x5 grid (containing a Mars Rover facing South) into an informative display" do
            # Arrange
            presenter = described_class.new
            fake_grid = RoverSpecHelper.make_fake_grid(2, 3, StraightLineRover.SOUTH)
            POPULATED_GRID = "This is what we think a 5x5 grid containing a Mars Rover facing South will look like (see notes.md)."

            # Act/Assert
            expect{presenter.show_display(fake_grid)}.to output(POPULATED_GRID).to_stdout
        end

        it "converts a 5x5 grid (containing a Mars Rover facing East) into an informative display" do
            # Arrange
            presenter = described_class.new
            fake_grid = RoverSpecHelper.make_fake_grid(4, 2, StraightLineRover.EAST)
            POPULATED_GRID = "This is what we think a 5x5 grid containing a Mars Rover facing East will look like (see notes.md)."

            # Act/Assert
            expect{presenter.show_display(fake_grid)}.to output(POPULATED_GRID).to_stdout
        end

        it "converts a 5x5 grid (containing a Mars Rover facing West) into an informative display" do
            # Arrange
            presenter = described_class.new
            fake_grid = RoverSpecHelper.make_fake_grid(0, 4, StraightLineRover.WEST)
            POPULATED_GRID = "This is what we think a 5x5 grid containing a Mars Rover facing West will look like (see notes.md)."

            # Act/Assert
            expect{presenter.show_display(fake_grid)}.to output(POPULATED_GRID).to_stdout
        end
    end
end