class MarsRoverApp
    USER_INFORMATION = "There are two types of Rover: Straight-line rover = 'SLR', Rover360 = '360'"
    REQUEST_FOR_FIRST_INPUT = "Please input a 3-letter name, type, start coordinates and a direction for your Rover - eg ANN,SLR,0,0,N"
    REQUEST_FOR_FURTHER_INPUT = "Please input, comma-separated, either rover name followed by a sequence of the following single chars: f(forwards), b(backwards), l(left), r(right) ... or a 3-letter name, start coordinates, type and a direction for a new Rover - eg ANN,SLR,0,0,N"
    BAD_INPUT_ERROR = "Sorry, I don't understand that input."
    OBSTACLE_ERROR = "Oh no, I'm sorry, I can't process that instruction. There is an obstacle in the way!"

    def initialize(presenter, communicator, grid, mars_rover_factory)
        @presenter = presenter
        @communicator = communicator
        @grid = grid
        @mars_rovers = Hash.new
    end

    def start
        begin
            @presenter.show_display(@grid)
            communicator.show_message(USER_INFORMATION)
            new_rover = communicator.get_input(REQUEST_FOR_FIRST_INPUT).split(",")            
            start_rover(new_rover)
            move_rover_repeatedly
        rescue StandardError => e
            puts BAD_INPUT_ERROR
        rescue ObstacleError => e
            puts OBSTACLE_ERROR
        end
    end

    private

    def move_rover_repeatedly
        instructions = ask_for_further_input
        while instructions do
            process_instructions(instructions)
            instructions = ask_for_further_input
        end
    end

    def ask_for_further_input
        communicator.show_message(USER_INFORMATION)
        instructions = communicator.get_input(REQUEST_FOR_FURTHER_INPUT)
    end

    def process_instructions(instructions)
        if is_movement?(instructions)
            move_rover(instructions)
        else
            start_rover(instructions)
        end
    end

    def move_rover(instructions)  
        instructions = instructions.split(",")
        rover_name = instructions[0]
        instructions.shift # removes first element
        instructions.each |movement| do  
            process_movement(movement, rover_name)
        end
    end

    def process_movement(movement, rover_name)
        if is_turn?(movement)            
            @mars_rovers[rover_name].turn(movement)
        else
            @mars_rovers[rover_name].move(movement, @grid)
        end
        update_display(@mars_rovers[rover_name])
    end

    def is_turn?(movement)
        # return true if it's l or r, false if it's f or b
    end

    def start_rover(new_rover)
        if (@grid.contains_obstacle?(new_rover[:x], new_rover[:y]))
            puts OBSTACLE_ERROR
        else
            rover = mars_rover_factory.generate_rover(new_rover[:name], new_rover[:type])
            rover.start(new_rover[:x], new_rover[:y], new_rover[:direction])
            update_display(rover)
            @mars_rovers[new_rover[:name]] = rover
        end
    end

    def update_display(rover)
        @grid.update(rover)
        @presenter.show_display(@grid)
    end
end