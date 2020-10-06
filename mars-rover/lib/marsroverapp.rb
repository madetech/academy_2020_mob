
class MarsRoverApp
    REQUEST_FOR_INPUT = "Please input Rover coordinates and direction."

    def start(presenter, grid)
        presenter.show_display(grid)
        user_input = presenter.get_input(REQUEST_FOR_INPUT)
    end
end