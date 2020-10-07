Given "the user hasn't started the program yet"
When "the user starts the program"
Then "an empty 5*5 grid appears"
And "the user is prompted for coordinates and direction"

Given "the user has started the program"
When "the user inputs the coordinates and direction"
Then "the display is updated with the position of the rover"
And "the display is updated with the direction of the rover"
And "the user is prompted to input movement or new direction"

Given "the user has input the coordinates and direction of the rover"
When "the user tells the rover to move forwards"
Then "the display is updated with the rover advanced one square in the direction it is facing"

Given "the user has input the coordinates and direction of the rover"
When "the user tells the rover to move backwards"
Then "the display is updated with the rover moving one square in the opposite direction to that which it faces"

Given "the user has input the coordinates and direction of the rover"
When "the user tells the rover to turn left"
Then "the display is updated with the rover facing a direction 90 degrees anticlockwise from before"

Given "the user has input the coordinates and direction of the rover"
When "the user tells the rover to turn right"
Then "the display is updated with the rover facing a direction 90 degrees clockwise from before"


