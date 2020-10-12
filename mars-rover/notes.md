# To Implement:

- The marsroverapp_spec should test narrow screen too?
- Check the width and height are the right way around in Grid.make_grid for a rectangular grid.
- Should be testing the method params etc? I'm so used to strongly typed languages I expect a lot of things to be caught by the compiler, but that won't happen in Ruby!

# Checking whether output includes specified string

Is this how you do it?

```
# Alright this was an error because I had abort in code I was testing.
# I have made a capture_stderr method to deal with this.

def capture_stderr(&block)
  original_stderr = $stderr.dup
  output_catcher = StringIO.new
  $stderr = output_catcher
  begin
    yield
  rescue SystemExit
  ensure
    $stderr = original_stderr
  end
  output_catcher.string
end

# I am using it like this:

error = capture_stderr('missing_filename.csv')
expect(error).to include('part of error message')
```
From here: https://github.com/rspec/rspec-core/issues/2311

# Displays

WIDE SCREEN MARS ROVER:
-------------------------------
|360^J|     | X X |     | SKY |
|<--|O|     |  X  |     |  X  |
|MAX|E|     | X X |     | HIGH|
-------------------------------
|S ^ J|     |3|M^U|     |3|MJO|
|L | I|     |6|E|M|     |6|E N|
|R | M|     |0vG|A|     |0vG->|
-------------------------------
|     | X X |     | A|X |     |
|     | AMY |     | N|  |     |
|     | --> |     | NvX |     |
-------------------------------
|     | FLY |     |360BO|     |
|     | --> |     |<-- B|     |
|     | JAN |     |ENA->|     |
-------------------------------
|     | X X |     | X X |     |
|     |  X  |     |  X  |     |
|     | X X |     | X X |     |
-------------------------------

(see below for alternative wide screen cell population)


NARROW SCREEN MARS ROVER:
----------------
|  |  |  |  |  |
|  |  |  |  |  |
----------------
|A |  |SK|  |  |
| v|  |HI|  |  |
----------------
|  |XX|  |  | ^|
|  |XX|  |  |B |
----------------
|  |  |  | C|  |
|  |  |  |< |  |
----------------
|  |D |  |  |  |
|  | >|  |  |  |
----------------


WIDE SCREEN - ALTERNATIVE WAYS OF POPULATING CELLS:

-------------------------------
| ^ J |     | | M |     |     |
| | I |     | | E |     |     |
| | M |     | v G |     |     |
-------------------------------
|  ^ J|     |  | M|     |     |
|  | I|     |  | E|     |     |
|  | M|     |  v G|     |     |
-------------------------------
|J  ^ |     |M  | |     |     |
|I  | |     |E  | |     |     |
|M  | |     |G  v |     |     |
-------------------------------
| J ^ |     | M | |     |     |
| I | |     | E | |     |     |
| M | |     | G v |     |     |
-------------------------------
|J ^  |     |M v  |     |     |
|I ^  |     |E v  |     |     |
|M ^  |     |G v  |     |     |
-------------------------------
|J  ^ |     |M  v |     |     |
|I  ^ |     |E  v |     |     |
|M  ^ |     |G  v |     |     |
-------------------------------
|     | JAN |     | ENA |     |
|     | --> |     | <-- |     |
|     |     |     |     |     |
-------------------------------
