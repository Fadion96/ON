#Author: Krzysztof Nowak

delta = Float64(2)^-52 # nasza delta 2^-52
x = Float64(1.0) # dla pierwszego przedzialu
println("-----------------------")
println(bits(Float64(x)))
println(bits(Float64(x + delta)))
println(bits(Float64(x + 2*delta)))
println("-----------------------")
y = Float64(1/2) # dla drugiego przedzialu
println(bits(Float64(y)))
println(bits(Float64(y + delta)))
println(bits(Float64(y + 2*delta)))
println(bits(Float64(y + delta/2))) #zauwazone rozlozenie w tym przedziale delta = 2^-53
println("-----------------------")
z = Float64(2)
println(bits(Float64(z)))
println(bits(Float64(z + delta)))
println(bits(Float64(z + 2*delta)))
println(bits(Float64(z + 4*delta))) #zauwazone rozlozenie w tym przedziale delta = 2^-51
