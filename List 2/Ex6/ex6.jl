# Author: Krzysztof Nowak

function foo(x1::Float64, x2::Float64, x3::Float64, x4::Float64, x5::Float64, x6::Float64, x7::Float64,i, limit)
    println("\\hline")
    println("\$", i, "\$ & \$", x1, "\$ & \$", x2, "\$ & \$", x3, "\$ & \$", x4, "\$ & \$", x5, "\$ & \$", x6, "\$ & \$", x7, "\$ \\\\")
    if i < limit
        x1 = x1 ^ 2 - 2.0
        x2 = x2 ^ 2 - 2.0
        x3 = x3 ^ 2 - 2.0
        x4 = x4 ^ 2 - 1.0
        x5 = x5 ^ 2 - 1.0
        x6 = x6 ^ 2 - 1.0
        x7 = x7 ^ 2 - 1.0
        return foo(x1, x2, x3, x4, x5, x6, x7, i + 1, limit )
    end
end
println("\\hline")
println("n & \$ 1) \$ & \$ 2) \$ & \$ 3) \$ & \$ 4) \$ & \$ 5) \$ & \$ 6) \$ & \$ 7) \$\\\\")
foo(Float64(1), Float64(2), Float64(1.99999999999999), Float64(1), Float64(-1), Float64(0.75), Float64(0.25), 0, 40)
println("\\hline")
