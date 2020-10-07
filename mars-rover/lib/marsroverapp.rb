
class MarsRoverApp
    REQUEST_FOR_FIRST_INPUT = "Please input Rover coordinates and direction."
    REQUEST_FOR_FURTHER_INPUT = "Please input one of the following single chars: f(forwards), b(backwards), l(left), r(right)."

    def initialize(presenter, grid, mars_rover)
        @presenter = presenter
        @grid = grid
        @mars_rover = mars_rover
    end

    def start
        @presenter.show_display(@grid)
        start_rover
        user_input = presenter.get_input(REQUEST_FOR_FURTHER_INPUT)
    end

    private

    def start_rover
        initial_position = presenter.get_input(REQUEST_FOR_FIRST_INPUT)
        @mars_rover.start(initial_position)
        update_display
    end

    def update_display
        @grid.update(@mars_rover)
        @presenter.show_display(@grid)
    end
end