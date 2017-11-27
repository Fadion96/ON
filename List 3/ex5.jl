import L3
using Plots

f = (x -> 3.0 * x - exp(x))
plotlyjs()
plot(f,label= "3x - e^x", color= :black,-1,2,)

delta = 10.0 ^ -4
epsilon = 10.0 ^ -4

mbresult = L3.mbisekcji(f, 1.0, 2.0, delta, epsilon)
mbresult2 = L3.mbisekcji(f, 0.0, 1.0, delta, epsilon)
mbresult3 = L3.mbisekcji(f, 0.0, 2.0, delta, epsilon)
mbresult4 = L3.mbisekcji(f, 1.0, 1.5, delta, epsilon)

println("\\hline")
println("przedział & r & f(r) & iteracje & errorcode\\\\")
println("\\hline")
println("\$[1,2]\$ & \$", mbresult[1], "\$ & \$", mbresult[2], "\$ & \$", mbresult[3], "\$ & \$", mbresult[4], "\$\\\\")
println("\\hline ")
println("\$[0,1]\$ &\$",mbresult2[1], "\$ & \$", mbresult2[2], "\$ & \$", mbresult2[3], "\$ & \$", mbresult2[4], "\$\\\\")
println("\\hline\n")


println("\\hline")
println("przedział & r & f(r) & iteracje & errorcode\\\\")
println("\\hline")
println("\$[0,2]\$ & \$", mbresult3[1], "\$ & \$", mbresult3[2],  "\$ & \$", mbresult3[3], "\$ & \$", mbresult3[4], "\$\\\\")
println("\\hline")
println("\$[1.0,1.5]\$ & \$", mbresult4[1],  "\$ & \$", mbresult4[2], "\$ & \$", mbresult4[3], "\$ & \$", mbresult4[4], "\$\\\\")
println("\\hline\n")
