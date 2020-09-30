require "sinatra/base"
require "erb"

class MyApp < Sinatra::Base
    enable :sessions

    get '/tictactoe' do
        @cells = Array.new(3){ Array.new(3) { "" } }
        erb :tictactoe
    end

    post '/tictactoe' do
        @cells = Array.new(3){ Array.new(3) { "" } }
        for row in 0..2 
            for col in 0..2 
                @cells[row][col] = params["row#{row}_col#{col}_in"]
            end
        end
        erb :tictactoe
    end

    run! if app_file == $0
end