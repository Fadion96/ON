#Author: Krzysztof Nowak

function macheps2(T)
    x = T(4.0 / 3.0)
    y = T(x - 1)
    z = T(3.0 * y)
    w = z - 1.0
    return w
end

println("Macheps2")
println("---Float16---")
println(macheps2(Float16))
println(eps(Float16))
println("---Float32---")
println(macheps2(Float32))
println(eps(Float32))
println("---Float32---")
println(macheps2(Float64))
println(eps(Float64))
