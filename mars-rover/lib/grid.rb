class Grid
    attr_accessor :display

    def initialize
        @display = "5*5 grid"
    end

    def show_display
        puts @display
    end
end