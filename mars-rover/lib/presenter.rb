require "grid"

class Presenter

    def show_display(grid)
        puts grid.grid_array
        puts REQUEST_FOR_INPUT
    end

    def get_input(input_prompt)
        puts input_prompt
        stdinput = gets.chomp
    end
end