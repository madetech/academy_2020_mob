require_relative "grid"

describe "grid" do
    context "grid initialization" do
        it "initializes an empty 5x5 grid" do
            #Arrange
            empty_grid = "5*5 grid"
            #Act
            grid = Grid.new
            #Assert
            expect(grid.display).to eq(empty_grid)
        end
        it "displays an empty 5x5 grid" do
            #Arrange
            grid = Grid.new
            empty_grid = "5*5 grid"
            #Act/Assert
            expect{grid.show_display}.to output(empty_grid).to_stdout
        end
    end
end