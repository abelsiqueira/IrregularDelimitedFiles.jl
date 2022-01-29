export read_as_dict

"""
    output = read_as_dict(filename; options...)

Read irregular file as a dictionary of integers to vector of integers.

## Inputs

- `filename`: File name.
- `key_sep::Char = '#'`: Character separating the key from the values.
- `array_sep::Char = ','`: Character separating values.
"""
function read_as_dict(
  filename;
  key_sep::Char = '#',
  array_sep::Char = ',',
)
  lines = split.(readlines(filename), key_sep)
  return Dict(
    Parsers.parse(Int, line[1]) => Parsers.parse.(Int, split(line[2], array_sep))
    for line in lines
  )
end