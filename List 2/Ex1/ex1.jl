# Author: Krzysztof Nowak

result = -1.00657107000000 * Float64(10)^-11

function sum_upto(x, y, T)
    s = 0
    for i = 1:5
        s = T(s + T(x[i] * y[i]))
    end
    return s
end

function sum_downto(x, y, T)
    s = T(0.0)
    for i = 5:-1:1
        s = T(s + T(x[i] * y[i]))
    end
    return s
end
function sum_desc(x, y, T)
    s_plus = T(0.0)
    s_minus = T(0.0)
    s_array = T[]
    for i = 1:5
        push!(s_array, T(x[i] * y[i]))
    end
    sort!(s_array, rev=true)
    for i = 1:5
        if s_array[i] >= 0.0
            s_plus = T(s_plus + s_array[i])
        else
            s_minus = T(s_minus + s_array[i])
        end
    end
    return T(s_plus + s_minus)
end

function sum_asc(x,y,T)
    s_plus = T(0.0)
    s_minus = T(0.0)
    s_array = T[]
    for i = 1:5
        push!(s_array,T(x[i] * y[i]))
    end
    sort!(s_array)
    for i = 1:5
        if s_array[i] > 0.0
            s_plus = T(s_plus + s_array[i])
        else
            s_minus = T(s_minus + s_array[i])
        end
    end
    return T(s_plus + s_minus)
end

x32 = Float32[2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y32 = Float32[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

x64 = Float64[2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y64 = Float64[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

a_32 = sum_upto(x32, y32, Float32)
a_64 = sum_upto(x64, y64, Float64)
b_32 = sum_downto(x32, y32, Float32)
b_64 = sum_downto(x64, y64, Float64)
c_32 = sum_desc(x32, y32, Float32)
c_64 = sum_desc(x64, y64, Float64)
d_32 = sum_asc(x32, y32, Float32)
d_64 = sum_asc(x64, y64, Float64)

println("\\hline")
println("Algorytm & Float32 & Float64 & Float32 błąd wzg. & Float64 błąd wzg. \\\\")
println("\\hline")
println("a. & \$", a_32, "\$ & \$", a_64, "\$ & \$", abs(result - a_32) / abs(result), "\$ & \$", abs(result - a_64) / abs(result), "\$ \\\\")
println("\\hline")
println("b. & \$", b_32, "\$ & \$", b_64, "\$ & \$", abs(result - b_32) / abs(result), "\$ & \$", abs(result - b_64) / abs(result), "\$ \\\\")
println("\\hline")
println("c. & \$", c_32, "\$ & \$", c_64, "\$ & \$", abs(result - c_32) / abs(result), "\$ & \$", abs(result - c_64) / abs(result), "\$ \\\\")
println("\\hline")
println("d. & \$", d_32, "\$ & \$", d_64, "\$ & \$", abs(result - d_32) / abs(result), "\$ & \$", abs(result - d_64) / abs(result), "\$ \\\\")
println("\\hline")
