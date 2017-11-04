#Author: Krzysztof Nowak

# Funkcja wyliczajaca macheps
# T - typ arytmetyki
function macheps(T)
    # x - zmienna trzymajaca obecny "epsilon"
    x = 1.0
    while T(1.0 + x / 2.0) > 1.0
        x = x / 2.0
    end
    return x
end

# Funkcja wyliczajaca ete
function eta(T)
    # x - zmienna trzymajaca obecna "ete"
    x = 1.0
    while T(x / 2.0) > 0.0
        x = x / 2.0
    end
    return x
end

# Funkcja wyliczajaca maksimum
function maxi(T)
    # x - zmienna trzymajaca obecna "maksymalna wartosc"
    x = 1.0
    # y - zmienna trzymajaca maksymalna ceche
    y = 0.0
    while !isinf(T(x * 2))
        x = x * 2
        y = y + 1
    end
    return (2.0 - macheps(T)) * T(2)^y
end


println("Macheps")
println("---Float16---")
println(macheps(Float16))
println(eps(Float16))
println("---Float32---")
println(macheps(Float32))
println(eps(Float32))
println("---Float64---")
println(macheps(Float64))
println(eps(Float64))
println("-----------------------")

println("Eta")
println("---Float16---")
println(eta(Float16))
println(nextfloat(Float16(0.0)))
println("---Float32---")
println(eta(Float32))
println(nextfloat(Float32(0.0)))
println("---Float64---")
println(eta(Float64))
println(nextfloat(Float64(0.0)))
println("-----------------------")

println("Max")
println("---Float16---")
println(Float64(maxi(Float16)))
println(realmax(Float16))
println("---Float32---")
println(Float64(maxi(Float32)))
println(realmax(Float32))
println("---Float64---")
println(maxi(Float64))
println(realmax(Float64))
println("-----------------------")
