
class MarsRoverApp
    REQUEST_FOR_FIRST_INPUT = "Please input Rover coordinates and direction."
    REQUEST_FOR_FURTHER_INPUT = "Please input one of the following single chars: f(forwards), b(backwards), l(left), r(right)."
    BAD_INPUT_ERROR = "Sorry, I don't understand that input."
    OBSTACLE_ERROR = "Oh no, I'm sorry, you can't move in that direction. There is an obstacle in the way!"

    def initialize(presenter, communicator, grid, mars_rover_factory)
        @presenter = presenter
        @communicator = communicator
        @grid = grid
        @mars_rover = mars_rover_factory.generate_rover
    end

    def start
        @presenter.show_display(@grid)
        start_rover
        move_rover_repeatedly
    end

    private

    def move_rover_repeatedly
        begin
            movement = communicator.get_input(REQUEST_FOR_FURTHER_INPUT)
            while movement do
                move_rover(movement)
                movement = communicator.get_input(REQUEST_FOR_FURTHER_INPUT)
            end
        rescue StandardError => e
            puts BAD_INPUT_ERROR
        rescue ObstacleError => e
            puts OBSTACLE_ERROR
        end
    end

    def move_rover(movements)  
        movements.split(",").each |movement| do     
            if is_turn?(movement)            
                @mars_rover.turn(movement)
            else
                @mars_rover.move(movement, @grid)
            end
            update_display
        end
    end

    def is_turn?(movement)
        # return true if it's l or r, false if it's f or b
    end

    def start_rover
        begin
            initial_position = communicator.get_input(REQUEST_FOR_FIRST_INPUT)
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