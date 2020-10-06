
class MarsRoverApp
    REQUEST_FOR_INPUT = "Please input Rover coordinates and direction."

    def start(presenter, grid, mars_rover)
        presenter.show_display(grid)
        user_input = presenter.get_input(REQUEST_FOR_INPUT)
        move_rover(user_input)
    end

    private

    def move_rover(new_position)
        mars_rover.move(user_input)
        grid.update(mars_rover)
        presenter.show_display(grid)
    end
end