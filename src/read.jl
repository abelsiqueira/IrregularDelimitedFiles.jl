export read_irregular

"""
    keys, arrays, values = read_irregular(filename; options...)

Read an irregular file like the one below:

```
1#1024
271#31,32,33,301
403#99,105
```

and returns three equal-sized arrays with this information such that they can be used to create a table.
For instance, for the file above, it would return:

- `keys    = [   1, 271, 271, 271, 271, 403, 403]`
- `indexes = [   0,   0,   1,   2,   3,   0,   1]`
- `values  = [1024,  31,  32,  33, 301,  99, 105]`

## Input
- `filename`: File name.
- `key_sep::Char = '#'`: Character separating the key from the values.
- `array_sep::Char = ','`: Character separating values.

## Output
Vectors `keys::Vector{Int}`, `indexes::Vector{Int}` and `values::Vector{Int}` such that a table provides the same information.
See the example above.
"""
function read_irregular(
  filename;
  key_sep::Char = '#',
  array_sep::Char = ',',
)
  # Read the file as bytes
  file = read(filename)
  num_elements = sum(c == UInt8(array_sep) || c == UInt8(key_sep) for c in file)
  keys = zeros(Int, num_elements)
  indexes = zeros(Int, num_elements)
  elements = zeros(Int, num_elements)
  @info num_elements

  count = 1
  key = -1
  idx = 0
  seek_start, seek_end = 1, 2
  file_size = length(file)

  while seek_start < file_size && count ≤ num_elements
    # Move seek_end until it is not a char, hence seed_start:seek_end-1 is the integer
    seek_end = seek_start + 1
    while (seek_end ≤ file_size && file[seek_end] ≥ 0x30)
      seek_end += 1
    end
    # Parse the integer
    value = Parsers.parse(Int, view(file, seek_start:seek_end-1))
    # Get the next char (or EOF)
    char = seek_end ≤ file_size ? file[seek_end] : '\0'

    if char == Int8(key_sep)
      # If the char is the key separator, then we start a new count
      key = value
      idx = 0
    else
      # Otherwise, just fill the arrays
      keys[count] = key
      indexes[count] = idx
      elements[count] = value
      idx += 1
      count += 1
    end
    seek_start = seek_end + 1
  end

  return keys, indexes, elements
end
