import L3
using Base.Test

delta = 10.0 ^ -10
epsilon = 10.0 ^ -10

@testset "mbisekcji Tests" begin
    @test L3.mbisekcji(x -> x^2 - x, -0.5, 0.5, delta, epsilon) == (0.0, 0.0, 1, 0)
    @test L3.mbisekcji(x -> x^2 - x, -0.5, 1.5, delta, epsilon) == (0.0, 0.0, 0, 1)
    @test L3.mbisekcji(x -> x, -2.0, 2.0, delta, epsilon) == (0.0, 0.0, 1, 0)
    @test L3.mbisekcji(x -> log(x), 0.5, 2.5, delta, epsilon) == (1.0, 0.0, 2, 0)
    @test L3.mbisekcji(x -> exp(x), -100.5, 2.5, delta, epsilon) == (0.0, 0.0, 0, 1)
    @test L3.mbisekcji(x -> x^3 + x^2 + x + 1, -6.0,2.0,delta,epsilon) == (-1.0, 0.0, 3, 0)
end

@testset "mstycznych Tests" begin
    @test L3.mstycznych(x -> x^2 - x, x -> 2x - 1, 0.5, delta, epsilon,100) == (0.500, -0.250, 1, 2)
    @test L3.mstycznych(x -> x^2 - x, x -> 2x - 1, -0.5, delta, epsilon,100) == (-5.396595270071815e-16, 5.396595270071818e-16, 5, 0)
    @test getindex(L3.mstycznych(x -> log(x), x -> 1.0 / x, 0.5, delta, epsilon,100),1) == 1.0
    @test L3.mstycznych(x -> x * exp(x), x -> exp(x)* (x+1), -0.5, 10.0^-5, 10.0^-5, 100) ==(3.0642493416461764e-7, 3.0642502806087233e-7, 5, 0)
    @test getindex(L3.mstycznych(x -> x^2 + 1, x -> 2 * x, 2.5, delta, epsilon,100),4) == 1
end

@testset "msiecznych Tests" begin
    @test L3.msiecznych(x -> x^2 - x, 0.0, 0.5, delta, epsilon,100) == (0.0, 0.0, 1, 0)
    @test getindex(L3.msiecznych(x -> log(x), 0.5, 10.0, delta, epsilon,100),4) == 0
    @test getindex(L3.msiecznych( x -> x * exp(-x),-2.5, 2.5, 10.0^(-5), 10.0^(-5), 10),4) == 1
end
