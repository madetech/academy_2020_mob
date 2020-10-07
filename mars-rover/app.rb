require_relative 'lib/presenter'
require_relative 'lib/grid'
require_relative 'lib/marsroverapp'

mars_rover = MarsRover.new
grid = Grid.new(5, 5)
presenter = Presenter.new
my_app = MarsRoverApp.new(presenter, grid, mars_rover)
my_app.start