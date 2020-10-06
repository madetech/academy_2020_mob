class Grid
    attr_accessor :display, :mars_rover

    def initialize(mars_rover)
        @display = "5*5 grid"
        @mars_rover = mars_rover
    end

    def show_display
        puts @display
    end
end