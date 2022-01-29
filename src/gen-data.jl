export gen_data

"""
    gen_data(filename; options...)

Writes a file with `num_rows` rows of data of the form

```
key#value1,value2,…,valueN
```

The number of values for a given row - `N` in the example - is generated randomly and is at most `max_num_values`.

## Inputs

- `filename`: Where to write the data.
- `num_rows::Int = 3`: Number of rows of data.
- `value_range::UnitRange = 1:1_000_000`: Range of values.
- `max_num_values::Int = 10`: Maximum number of values per row (key not included).
- `value_distribution_type::Symbol = :uniform`: How to generate the number of values per row.
  - `:uniform`: Uniform distribution taken from `1:max_num_values`.
  - `:exponential`: Exponentially distributed value. Take a number `α ∈ [0,log(max_num_values)]` and return ``⌊exp(α)⌋``
- `key_sep::Char = '#'`: Key separator
- `array_sep::Char = ','`: Array separator
"""
function gen_data(
  filename;
  num_rows::Int = 3,
  value_range::UnitRange = 1:1_000_000,
  max_num_values::Int = 10,
  value_distribution_type::Symbol = :uniform,
  key_sep::Char = '#',
  array_sep::Char = ',',
)
  open(filename, "w") do io
    keys = sort(rand(value_range, num_rows))
    while !allunique(keys)
      keys = unique(keys)
      keys = sort([keys; rand(1:100_000, num_rows - length(keys))])
    end
    for key in keys
      key = rand(value_range)
      print(io, key)
      print(io, key_sep)
      num_values = if value_distribution_type == :uniform
        rand(1:max_num_values)
      elseif value_distribution_type == :exponential
        α = rand() * log(max_num_values) # ∈ [0, log(max_num_values)]
        floor(Int, exp(α))
      end
      values = rand(value_range, num_values)
      println(io, join(values, array_sep))
    end
  end
end
