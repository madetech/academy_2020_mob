require_relative '../../lib/presenters/wide_screen_presenter'
require_relative '../../lib/grid'
require_relative '../helpers/rover_spec_helper'

describe WideScreenPresenter do
    context "#show_display" do
        it "converts an empty 2x3 grid into a beautiful display" do
            # Arrange
            presenter = described_class.new
            grid = Grid.new(2, 3)
            EMPTY_GRID = 
            "-------------\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "-------------\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "-------------\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "-------------\n"

            # Act/Assert
            expect{presenter.show_display(grid)}.to output(EMPTY_GRID).to_stdout
        end

        it "converts a 2x3 grid containing an obstacle into an informative display" do
            # Arrange
            presenter = described_class.new
            grid = RoverSpecHelper.make_real_grid(2, 3, [1,1])
            POPULATED_GRID = 
            "-------------\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "-------------\n" +
            "|     | X X |\n" +
            "|     |  X  |\n" +
            "|     | X X |\n" +
            "-------------\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "-------------\n"

            # Act/Assert
            expect{presenter.show_display(grid)}.to output(POPULATED_GRID).to_stdout
        end

        it "converts a 2x3 grid containing a sky-high obstacle into an informative display" do
            # Arrange
            presenter = described_class.new
            grid = RoverSpecHelper.make_real_grid(2, 3, [], [1,0])
            POPULATED_GRID = 
            "-------------\n" +
            "|     | SKY |\n" +
            "|     |  X  |\n" +
            "|     | HIGH|\n" +
            "-------------\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "-------------\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "-------------\n"

            # Act/Assert
            expect{presenter.show_display(grid)}.to output(POPULATED_GRID).to_stdout
        end

        it "converts a 2x3 grid (containing a Mars Rover facing North) into an informative display" do
            # Arrange
            presenter = described_class.new
            grid = RoverSpecHelper.make_real_grid_with_rover(2, 3, 1, 2, StraightLineRover::NORTH)
            POPULATED_GRID = 
            "-------------\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "-------------\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "-------------\n" +
            "|     | 360 |\n" +
            "|     | ^^^ |\n" +
            "|     | TST |\n" +
            "-------------\n"

            # Act/Assert
            expect{presenter.show_display(grid)}.to output(a_string_including(POPULATED_GRID)).to_stdout
        end

        it "converts a 2x3 grid (containing a Mars Rover facing South) into an informative display" do
            # Arrange
            presenter = described_class.new
            grid = RoverSpecHelper.make_real_grid_with_rover(2, 3, 1, 1, StraightLineRover::SOUTH)
            POPULATED_GRID = 
            "-------------\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "-------------\n" +
            "|     | 360 |\n" +
            "|     | vvv |\n" +
            "|     | TST |\n" +
            "-------------\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "-------------\n"

            # Act/Assert
            expect{presenter.show_display(grid)}.to output(POPULATED_GRID).to_stdout
        end

        it "converts a 2x3 grid (containing a Mars Rover facing East) into an informative display" do
            # Arrange
            presenter = described_class.new
            grid = RoverSpecHelper.make_real_grid_with_rover(2, 3, 1, 0, StraightLineRover::EAST)
            POPULATED_GRID = 
            "-------------\n" +
            "|     | 360 |\n" +
            "|     | <<< |\n" +
            "|     | TST |\n" +
            "-------------\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "-------------\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "-------------\n"

            # Act/Assert
            expect{presenter.show_display(grid)}.to output(POPULATED_GRID).to_stdout
        end

        it "converts a 2x3 grid (containing a Mars Rover facing West) into an informative display" do
            # Arrange
            presenter = described_class.new
            grid = RoverSpecHelper.make_real_grid_with_rover(2, 3, 0, 1, StraightLineRover::WEST)
            POPULATED_GRID = 
            "-------------\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "-------------\n" +
            "| 360 |     |\n" +
            "| >>> |     |\n" +
            "| TST |     |\n" +
            "-------------\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "|     |     |\n" +
            "-------------\n"

            # Act/Assert
            expect{presenter.show_display(grid)}.to output(POPULATED_GRID).to_stdout
        end

        it "converts a 2x3 grid containing obstacles and a rover into an informative display" do
            # Arrange
            presenter = described_class.new
            grid = RoverSpecHelper.make_real_grid_with_rover(2, 3, 0, 2, StraightLineRover::NORTH, [1,1], [1,0])
            POPULATED_GRID = 
            "-------------\n" +
            "|     | SKY |\n" +
            "|     |  X  |\n" +
            "|     | HIGH|\n" +
            "-------------\n" +
            "|     | X X |\n" +
            "|     |  X  |\n" +
            "|     | X X |\n" +
            "-------------\n" +
            "| 360 |     |\n" +
            "| ^^^ |     |\n" +
            "| TST |     |\n" +
            "-------------\n"

            # Act/Assert
            expect{presenter.show_display(grid)}.to output(POPULATED_GRID).to_stdout
        end
    end
end