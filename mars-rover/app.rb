require_relative 'lib/presenter'
require_relative 'lib/grid'
require_relative 'lib/marsroverapp'

grid = Grid.new
presenter = Presenter.new
my_app = MarsRoverApp.new
my_app.start(presenter, grid)