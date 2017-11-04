#Author: Krzysztof Nowak

function f(x)
    return sqrt(x^2 + 1) - 1
end

function g(x)
    return x^2/(sqrt(x^2 + 1) + 1)
end

for i = 1:20
    print("8^-")
    println(i)
    print("f: ")
    println(f(Float64(8)^-i))
    print("g: ")
    println(g(Float64(8)^-i))
    println("-----------------------")
end
