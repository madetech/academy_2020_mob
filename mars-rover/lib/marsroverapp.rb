
class MarsRoverApp
    REQUEST_FOR_INPUT = "Please input Rover coordinates and direction."

    def initialize(presenter, grid, mars_rover)
        @presenter = presenter
        @grid = grid
        @mars_rover = mars_rover
    end

    def start
        @presenter.show_display(@grid)
        user_input = presenter.get_input(REQUEST_FOR_INPUT)
        move_rover(user_input)
    end

    private

    def move_rover(new_position)
        @mars_rover.move(new_position)
        @grid.update(@mars_rover)
        @presenter.show_display(@grid)
    end
end