using IrregularDelimitedFiles
using Random, Test

@testset "read" begin
  keys, indexes, values = read_irregular(joinpath(@__DIR__, "test_file.txt"))
  @test keys == [1, 271, 271, 271, 271, 403, 403]
  @test indexes == [0, 0, 1, 2, 3, 0, 1]
  @test values == [1024, 31, 32, 33, 301, 99, 105]
end

@testset "read_as_dict" begin
  dict = read_as_dict(joinpath(@__DIR__, "test_file.txt"))
  @test sort([keys(dict)...]) == [1, 271, 403]
  @test dict[1] == [1024]
  @test dict[271] == [31, 32, 33, 301]
  @test dict[403] == [99, 105]
end

@testset "Test writing and reading with different separators" begin
  filename = mktemp()[1]
  Random.seed!(0)
  gen_data(filename)
  dict = read_as_dict(filename)
  Random.seed!(0)
  gen_data(filename, key_sep='-', array_sep=':')
  dict2 = read_as_dict(filename, key_sep='-', array_sep=':')
  @test dict == dict2
end

@testset "Increase coverage of gen_data" begin
  filename = mktemp()[1]
  for dist in [:uniform, :exponential]
    gen_data(filename, value_distribution_type=dist)
  end
  gen_data(filename, value_range=1:50, num_rows=50)
end