# Author: Krzysztof Nowak
using L4
using Base.Test

@testset "ilorazyRoznicowe Tests" begin
    @test ilorazyRoznicowe([-2.0, -1.0, 0.0, 1.0, 2.0, 3.0], [-25.0,3.0,1.0,-1.0,27.0,235.0]) == [-25.0, 28.0, -15.0, 5.0, 0.0, 1.0]
    @test ilorazyRoznicowe([3.0, 1.0, 5.0, 6.0], [1.0, -3.0, 2.0, 4.0]) ≈ [1.0, 2.0, -0.375, 0.175]
end

@testset "warNewton Tests" begin
    @test warNewton([-2.0, -1.0, 0.0, 1.0, 2.0, 3.0], ilorazyRoznicowe([-2.0, -1.0, 0.0, 1.0, 2.0, 3.0], [-25.0,3.0,1.0,-1.0,27.0,235.0]) , 3.0) == 235.0
    @test warNewton([3.0, 1.0, 5.0, 6.0], ilorazyRoznicowe([3.0, 1.0, 5.0, 6.0], [1.0, -3.0, 2.0, 4.0]),5.0) == 2.0
end

@testset "naturalna Tests" begin
    @test naturalna([-2.0, -1.0, 0.0, 1.0, 2.0, 3.0], ilorazyRoznicowe([-2.0, -1.0, 0.0, 1.0, 2.0, 3.0], [-25.0,3.0,1.0,-1.0,27.0,235.0])) == [1.0, -3.0, 0.0, 0.0, 0.0, 1.0]
    @test naturalna([3.0, 1.0, 5.0, 6.0], ilorazyRoznicowe([3.0, 1.0, 5.0, 6.0], [1.0, -3.0, 2.0, 4.0])) ≈ [-8.75, 7.525, -1.95, 0.175]
end
