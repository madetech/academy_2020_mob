require_relative 'lib/webpresenter'
require_relative 'lib/narrow_screen_presenter'
require_relative 'lib/wide_screen_presenter'
require_relative 'lib/communicator'
require_relative 'lib/grid'
require_relative 'lib/marsroverapp'
require_relative 'lib/mars_rover_factory'

mars_rover_factory = MarsRoverFactory.new
grid = Grid.new(5, 5)
grid.add_obstacle(3,2)
grid.add_sky_high_obstacle(2,3)
wide_screen_presenter = WideScreenPresenter.new
narrow_screen_presenter = NarrowScreenPresenter.new
web_presenter = WebPresenter.new
communicator = Communicator.new

user_choice = ask_user_which_presenter_they_prefer

my_app = MarsRoverApp.new(
    user_choice[:presenter], 
    user_choice[:communicator], 
    user_choice[:grid], 
    mars_rover_factory)

my_app.start

def choose_presenter
    case ask_user_which_presenter_they_prefer
    when :wide_screen
        {   
            :presenter => wide_screen_presenter,
            :communicator => communicator,
            :grid => grid
        }
    when :narrow_screen
        {   
            :presenter => narrow_screen_presenter,
            :communicator => communicator,
            :grid => grid
        }
    when :web
        {   
            :presenter => web_presenter,
            :communicator => web_presenter,
            :grid => web_presenter
        }
    end
end

def ask_user_which_presenter_they_prefer
    # ask user to decide between the multiple types of presenter
    # For now, defaulting to wide screen.
    :wide_screen_presenter
end