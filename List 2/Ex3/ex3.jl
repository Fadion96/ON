include("matcond.jl")
include("hilb.jl")

function hilb_results()
    for i in 1:20
        A = hilb(i)
        b = A * ones(i, 1)
        x_gauss = A \ b
        x_inv =  inv(A) * b
        println("degree: ", i, " Cond: ", cond(A), " Rank: ", rank(A))
        println("Relative err Gauss: ", norm(ones(i, 1) - x_gauss) / norm(ones(i, 1)))
        println("Relative err Inversion: ", norm(ones(i, 1) - x_inv) / norm(ones(i, 1)))
        println("-------------------------------------------")
    end
end

function random_result(n::Int, c::Float64)
    A = matcond(n, c)
    b = A * ones(n, 1)
    x_gauss = A \ b
    x_inv =  inv(A) * b
    println("degree: ", n, " Cond: ", c, " Rank: ", rank(A))
    println("Relative err Gauss: ", norm(x_gauss - ones(n, 1)) / norm(ones(n, 1)))
    println("Relative err Inversion: ", norm(x_inv - ones(n,1)) / norm(ones(n, 1)))
    println("-------------------------------------------")
end

function random_pack(n::Int)
    random_result(n, 1.0)
    random_result(n, 10.0 ^ 3)
    random_result(n, 10.0 ^ 7)
    random_result(n, 10.0 ^ 12)
    random_result(n, 10.0 ^ 16)
end

hilb_results()
random_pack(5)
random_pack(10)
random_pack(20)
