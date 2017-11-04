#Author: Krzysztof Nowak

function foo()
    x = 1.0 # poczatek sprawdzania
    min = 2.0 #poczatkowe minimum
    while x != 2.0
        if Float64(x*Float64(1.0 / x)) != 1.0
                min = x
                break
        end
        x = nextfloat(Float64(x))
    end
    return min
end
println("Min")
println((foo()))
