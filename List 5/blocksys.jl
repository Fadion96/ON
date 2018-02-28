# Author: Krzysztof Nowak

__precompile__()
module blocksys
export readMatrix, readVector, gauss, calculateB, normalGauss

function readMatrix(filename::AbstractString)
    open(filename) do f
        x = readline(f)
        x = split(x)
        n = parse(Int, x[1])
        l = parse(Int, x[2])
        A = spzeros(Float64, n, n)
        while !eof(f)
            x = readline(f)
            x = split(x)
            i = parse(Int, x[1])
            j = parse(Int, x[2])
            A[i, j] = parse(Float64, x[3])
        end
        return n, l, A
    end
end

function readVector(filename::AbstractString)
    open(filename) do f
        x = readline(f)
        n = parse(Int, x)
        b = Vector{Float64}(n)
        for i = 1 : n
            x = readline(f)
            b[i] = parse(Float64, x)
        end
        return b
    end
end

function gauss(A::SparseMatrixCSC{Float64,Int64}, b::Vector{Float64}, n::Int64, l::Int64, pivot::Bool)
    for j = 1 : l
        if pivot
            index = j - 1 + findmax(abs.(A[j : l, j]))[2]
            A[j, j : 2 * l], A[index, j : 2 * l] = A[index, j : 2 * l], A[j, j : 2 * l]
            b[j], b[index] = b[index], b[j]
        end
        for i = j + 1 : 2 * l
            if abs(A[j,j]) < eps(Float64)
                error("Zero na przekatnej")
            end
            m = A[i, j] / A[j, j]
            for k = j + 1 : 2 * l
                A[i, k] = A[i, k] - m * A[j, k]
            end
            A[i, j] = 0.0
            b[i] = b[i] - m * b[j]
        end
    end

    for a = 1 : Int((n / l) - 2)
        for j = a * l + 1 : (a + 1) * l
            if pivot
                index = j - 1 + findmax(abs.(A[j : (a + 1) * l, j]))[2]
                A[j, j : (a + 2) * l], A[index, j : (a + 2) * l] = A[index, j : ( a + 2) * l], A[j, j : ( a + 2) * l]
                b[j], b[index] = b[index], b[j]
            end
            for i = j + 1 : (a + 2) * l
                if abs(A[j,j]) < eps(Float64)
                    error("Zero na przekatnej")
                end
                m = A[i, j] / A[j, j]
                for k = j + 1 : (a + 2) * l
                    A[i, k] = A[i, k] - m * A[j, k]
                end
                A[i, j] = 0.0
                b[i] = b[i] - m * b[j]
            end
        end
    end

    for j = n - l + 1 : n - 1
        if pivot
            index = j - 1 + findmax(abs.(A[j : n, j]))[2]
            A[j, j : n], A[index, j : n] = A[index, j : n], A[j, j : n]
            b[j], b[index] = b[index], b[j]
        end
        for i = j + 1 : n
            if abs(A[j,j]) < eps(Float64)
                error("Zero na przekatnej")
            end
            m = A[i, j] / A[j, j]
            for k = j + 1 : n
                A[i, k] = A[i, k] - m * A[j, k]
            end
            A[i, j] = 0.0
            b[i] = b[i] - m * b[j]
        end
    end

    x = Vector{Float64}(n)
    v = Int(n / l)
    for i = n : -1 : n - l
        x[i] = b[i]
        for j = i + 1 : n
            x[i] = x[i] - A[i, j] * x[j]
        end
        x[i] = x[i] / A[i, i]
    end
    for i = n - l - 1 : -1 : 1
        x[i] = b[i]
        s::Int = ceil(i / l)
        for j = i + 1 : n - (v - s - 1) * l
            x[i] = x[i] - A[i, j] * x[j]
        end
        x[i] = x[i] / A[i, i]
    end
    return x
end

function calculateB(A::SparseMatrixCSC{Float64,Int64}, x::Vector{Float64}, n::Int64, l::Int64)
    b = zeros(Float64,n)
    for i = 1 : l
        for j = 1 : 2 * l
            b[i] = b[i] + A[i, j] * x[j]
        end
    end
    for a = 1 : Int(n/l - 2)
        for i = a * l + 1 : (a + 1) * l
            for j = (a  - 1) * l + 1 : (a + 2) * l
                b[i] = b[i] + A[i, j] * x[j]
            end
        end
    end
    for i = n - l + 1 : n
        for j = Int(n/l - 2) * l : n
            b[i] = b[i] + A[i, j] * x[j]
        end
    end
    return b
end

function normalGauss(A::SparseMatrixCSC{Float64,Int64}, b::Vector{Float64}, n::Int64)
    for k = 1 : n - 1
        println("Test2:", k)
        for i = k + 1 : n
            l = A[i, k] / A[k, k]
            for j = k + 1 : n
                A[i, j] = A[i, j] - l * A[k, j]
            end
            b[i] = b[i] - l * b[k]
            A[i, k] = 0.0
        end
    end
    n = length(b)
    x = Vector{Float64}(n)
    for i = n : -1 : 1
        println("Test2:", i)
        x[i] = b[i]
        for j = i + 1 : n
            x[i] = x[i] - A[i, j] * x[j]
        end
        x[i] = x[i] / A[i, i]
    end

    return x
end

end
