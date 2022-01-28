using IrregularDelimitedFiles
using Test

@testset "IrregularDelimitedFiles.jl" begin
  keys, indexes, values = read_irregular(joinpath(@__DIR__, "test_file.txt"))
  @test keys == [1, 271, 271, 271, 271, 403, 403]
  @test indexes == [0, 0, 1, 2, 3, 0, 1]
  @test values == [1024, 31, 32, 33, 301, 99, 105]
end
