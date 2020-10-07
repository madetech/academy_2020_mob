
class MarsRoverApp
    REQUEST_FOR_FIRST_INPUT = "Please input Rover coordinates and direction."
    REQUEST_FOR_FURTHER_INPUT = "Please input one of the following single chars: f(forwards), b(backwards), l(left), r(right)."
    BAD_INPUT_ERROR = "Sorry, I don't understand that input."

    def initialize(presenter, grid, mars_rover)
        @presenter = presenter
        @grid = grid
        @mars_rover = mars_rover
    end

    def start
        @presenter.show_display(@grid)
        start_rover
        move_rover
    end

    private

    def move_rover
        begin
            movement = presenter.get_input(REQUEST_FOR_FURTHER_INPUT, BAD_INPUT_ERROR)
            if is_turn?(movement)            
                @mars_rover.turn(movement)
            else
                @mars_rover.move(movement)
            end
            update_display
        rescue StandardError => e
            puts BAD_INPUT_ERROR
        end
    end

    def is_turn?(movement)
        # return true if it's l or r, false if it's f or b
    end

    def start_rover
        begin
            initial_position = presenter.get_input(REQUEST_FOR_FIRST_INPUT, BAD_INPUT_ERROR)
            @mars_rover.start(initial_position.split(","))
            update_display
        rescue StandardError => e
            puts BAD_INPUT_ERROR
        end
    end

    def update_display
        @grid.update(@mars_rover)
        @presenter.show_display(@grid)
    end
end