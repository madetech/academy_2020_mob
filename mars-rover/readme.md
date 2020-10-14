This is an implementation of the Mars Rover kata: https://learn.madetech.com/katas/mars-rover/

## Running the app

Run `bundle install` first, then run the app like this:

```
ruby app.rb
```

## Demo Notes

For useful commits and nomtes on what they demonstrate, see separate [demo notes page](demo-notes.md).

## General Notes

For notes on what still needs doing and what the display might look like, see separate [notes page](notes.md).

## Intro to kata

You’re part of the team that explores Mars by sending remotely controlled vehicles to the surface of the planet. Develop an API that translates the commands sent from earth to instructions that are understood by the rover.

## Requirements

- You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
- The rover receives a character array of commands.
- Implement commands that move the rover forward/backward (f,b).
- Implement commands that turn the rover left/right (l,r).
- Implement wrapping from one edge of the grid to another. (planets are spheres after all)
- Implement obstacle detection before each move to a new square. If a given sequence of commands encounters an obstacle, the rover moves up to the last possible point, aborts the sequence and reports the obstacle.

## Rules

Be careful about edge cases and exceptions. We can not afford to lose a mars rover, just because the developers overlooked a null pointer.

## References

Victor Farcic
Kata Log Rocks: Mars Rover
