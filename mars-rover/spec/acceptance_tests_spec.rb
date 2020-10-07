Given "the user hasn't started the program yet"
When "the user starts the program"
Then "an empty 5*5 grid appears"
And "the grid shows existing obstacles"
And "the user is prompted for coordinates and direction"

Given "the user has started the program"
When "the user inputs invalid coordinates or direction"
Then "the user is shown an error"

Given "the user has started the program"
When "the user inputs the coordinates and direction"
Then "the display is updated with the position of the rover"
And "the display is updated with the direction of the rover"
And "the user is prompted to input movement or new direction"

Given "the user has input the coordinates and direction of the rover"
When "the user gives an invalid further instruction"
Then "the user is shown an error"

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

Given "the user has input coordinates and direction placing the rover facing the edge of the grid"
When "the user tells the rover to move forwards"
Then "the display is updated with the rover having 'wrapped' around to the other side of the grid"

Given "the user has input coordinates and direction"
When "the display has updated"
Then "the user can keep inputting repeated movements and turns"
And "the display will update in response to every input"

Given "the user has input coordinates and direction"
When "the display has updated"
Then "the user can input several movements and turns in one input"
And "the display will update in response to every movement and turn in the input"

Given "the user has input coordinates and direction placing the rover facing an obstacle"
When "the user tells the rover to move forwards"
Then "an error will inform the user that there is an obstacle in the way"

Given "the user has input coordinates and direction placing the rover with its back to an obstacle"
When "the user tells the rover to move backwards"
Then "an error will inform the user that there is an obstacle in the way"


