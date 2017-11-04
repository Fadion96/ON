#Author: Krzysztof Nowak

function derivative(x::Float64,h::Float64,f::Function)
          return (f(x + h) - f(x))/h
end

function f(x)
     return sin(x) + cos(3.0*x)
end

for i = 0:54
     print("2^-")
     println(i)
     println(derivative(1.0,Float64(2)^-i,f))
     println("-----------------------")
end
