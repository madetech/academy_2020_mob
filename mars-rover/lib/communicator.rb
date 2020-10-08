class Communicator
    def show_message(message)
        puts message
    end

    def get_input(input_prompt)
        puts input_prompt
        stdinput = gets.chomp
        if is_invalid?(stdinput)
            raise StandardError.new
        end
    end

    def is_invalid?(input)
        # check for invalid input
    end
end