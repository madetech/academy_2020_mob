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
  
    it "starts with an empty 3x3 tic-tac-toe grid" do
      get '/tictactoe'
      expect(last_response).to be_ok
      for row in 0..2 
        for col in 0..2 
          expect(last_response.body).to have_tag('input', :with => { :class => "row#{row+1} col#{col+1}" })
        end
      end 
    end
end