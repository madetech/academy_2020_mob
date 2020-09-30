ENV['APP_ENV'] = 'test'

require "spec_helper"

require_relative '../lib/tictactoe_logic'
require 'rspec'

RSpec.describe 'The tic-tac-toe game logic' do
    it "does not declare a winner for an empty grid" do
        # Arrange
        grid_cells =  [["", "", ""], \
                       ["", "", ""], \
                       ["", "", ""]]
        
        # Act
        result = TicTacToeLogic.new.get_winner(grid_cells)

        # Assert
        expect(result).to eq(nil)
    end
end