# Author: Krzysztof Nowak

function population(x::Float32, y::Float32, z::Float64, r, i, limit)
    println("\\hline")
    println("\$", i, "\$ & \$", x, "\$ & \$", y, "\$ & \$", z, "\$ \\\\")
    if i < limit
        x = Float32(x + r * x * (1.0 - x))
        y = Float32(y + r * y * (1.0 - y))
        z = Float64(z + r * z * (1.0 - z))
        if i == 9
            return population(x, trunc(y, 3), z, r, i + 1, limit)
        else
            return population(x, y, z, r, i + 1, limit)
        end
    end
end
println("\\hline")
println("n & Float32  & Float32 obcięte & Float64\\\\")
population(Float32(0.01), Float32(0.01), 0.01, 3, 0, 40)
println("\\hline")
