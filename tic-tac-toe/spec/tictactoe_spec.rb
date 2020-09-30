ENV['APP_ENV'] = 'test'

require "spec_helper"

require_relative '../tictactoe'
require 'rspec'
require 'rack/test'

RSpec.describe 'The HelloWorld App' do
    include Rack::Test::Methods
  
    def app
      MyApp
    end
  
    context "simple display" do
      it "starts with an empty 3x3 tic-tac-toe grid" do
        # Act
        get '/tictactoe'
        
        # Assert
        expect(last_response).to be_ok
        for row in 0..2 
          for col in 0..2 
            expect(last_response.body).to have_tag('input', :with => { :class => "row#{row} col#{col}" })
          end
        end 
      end
    end
end