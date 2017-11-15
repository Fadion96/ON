# Author: Krzysztof Nowak

include("matcond.jl")
include("hilb.jl")

function hilb_results()
    for i in 1:20
        A = hilb(i)
        b = A * ones(i, 1)
        x_gauss = A \ b
        x_inv =  inv(A) * b
        println("\\hline")
        print("\$", i, "\$ & \$", cond(A), "\$ & \$", rank(A), "\$ & \$")
        println(norm(x_gauss - ones(i, 1)) / norm(ones(i, 1)), "\$ & \$", norm(x_inv - ones(i,1)) / norm(ones(i, 1)), "\$ \\\\")
    end
end

function random_result(n::Int, c::Float64)
    A = matcond(n, c)
    b = A * ones(n, 1)
    x_gauss = A \ b
    x_inv =  inv(A) * b
    println("\\hline")
    print("\$", n, "\$ & \$", c, "\$ & \$", rank(A), "\$ & \$")
    println(norm(x_gauss - ones(n, 1)) / norm(ones(n, 1)), "\$ & \$", norm(x_inv - ones(n,1)) / norm(ones(n, 1)), "\$ \\\\")
end

function random_pack(n::Int)
    random_result(n, 1.0)
    random_result(n, 10.0 ^ 3)
    random_result(n, 10.0 ^ 7)
    random_result(n, 10.0 ^ 12)
    random_result(n, 10.0 ^ 16)
end
println("\\hline")
println("n & cond & rząd & Gauss błąd wzg. & Inwersja błąd wzg. \\\\")
hilb_results()
println("\\hline")

println("\\hline")
println("n & cond & rząd & Gauss błąd wzg. & Inwersja błąd wzg. \\\\")
random_pack(5)
random_pack(10)
random_pack(20)
println("\\hline")
