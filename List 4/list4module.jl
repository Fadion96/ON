# Author: Krzysztof Nowak

__precompile__()
module L4

using Plots

export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx

function ilorazRoznicowy(x::Vector{Float64}, f::Vector{Float64})
    if length(x) == 1
        return f[1]
    elseif length(x) == 2
        return (f[2] - f[1])/(x[2] - x[1])
    else
        return (ilorazRoznicowy(x[2:length(x)],f[2:length(f)]) - ilorazRoznicowy(x[1:length(x) - 1],f[1:length(f) - 1])) / (x[length(x)] - x[1])
    end
end

function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    fx = Array{Float64}(length(x))

    for i = 1:length(x)
        fx[i] = ilorazRoznicowy(x[1:i],f[1:i])
    end
    return fx
end

function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
    w = Array{Float64}(length(x))
    w[length(x)] = fx[length(fx)]
    for i = length(x)-1:-1:1
        w[i] =  fx[i] + (t - x[i]) * w[i + 1]
    end
    return w[1]
end

function naturalna(x::Vector{Float64}, fx::Vector{Float64})
    a = Array{Float64}(length(x))
    a[length(x)] = fx[length(fx)]
    for i = length(x)-1:-1:1
        a[i] = fx[i]
        for j = i:1:length(x) - 1
            a[j] = a[j] - (a[j + 1] * x[i])
        end
    end
    return a
end

function rysujNnfx(f, a::Float64, b::Float64, n::Int)
    x = Array{Float64}(n+1)
    fx = Array{Float64}(n+1)
    for i = 0:n
        x[i + 1] = a + i * ((b - a) / n)
        fx[i + 1] = f(x[i + 1])
    end
    ilorazy = ilorazyRoznicowe(x, fx)
    fi = y -> warNewton(x, ilorazy, y)
    plotlyjs()
    plot(f, label="Funkcja", a, b)
    plot!(fi, label="Interpolacja", a ,b)
end

end  # module L4
