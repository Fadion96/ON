import L3
using Plots

pf = (x -> - exp(1 - x))
f = (x -> exp(1 - x) - 1)
g = (x -> x * exp(-x))
pg = (x -> -exp(-x) * (x -1))


delta = 10.0 ^ -5
epsilon = 10.0 ^ -5

plotlyjs()
plot(f,label=  "e^(1-x) - 1", color= :black,-2,4)
plot(g,label=  "- x*e^(-x) ", color= :black,-0.5,10)


mbresultf = L3.mbisekcji(f, 0.5, 1.5, delta, epsilon)
mbresultf2 = L3.mbisekcji(f, 0.5, 1.0, delta, epsilon)
mbresultf3 = L3.mbisekcji(f, 1.0, 1.5, delta, epsilon)
println("\\hline")
println("przedział & r & f(r) & iteracje & errorcode\\\\")
println("\\hline")
println("\$[0.5,1.5]\$ & \$", mbresultf[1], "\$ & \$", mbresultf[2],  "\$ & \$", mbresultf[3], "\$ & \$", mbresultf[4], "\$\\\\")
println("\\hline")
println("\$[0.5,1]\$ & \$", mbresultf2[1], "\$ & \$", mbresultf2[2],  "\$ & \$", mbresultf2[3], "\$ & \$", mbresultf2[4], "\$\\\\")
println("\\hline")
println("\$[1,1.5]\$ & \$", mbresultf3[1], "\$ & \$", mbresultf3[2],  "\$ & \$", mbresultf3[3], "\$ & \$", mbresultf3[4], "\$\\\\")
println("\\hline \n")

println("\\hline")
println("\$x_{0} \$ & r & f(r) & iteracje & errorcode\\\\")
for i = 0.0:0.25:2
    msresult = L3.mstycznych(f, pf, i, delta, epsilon, 100)
    println("\\hline")
    println("\$", i, "\$ & \$", msresult[1], "\$ & \$", msresult[2], "\$ & \$", msresult[3], "\$ & \$", msresult[4], "\$\\\\")
end
println("\\hline")
msresult = L3.mstycznych(f, pf, 5.0, delta, epsilon, 100)
println("\$", 5.0, "\$ & \$", msresult[1], "\$ & \$", msresult[2], "\$ & \$", msresult[3], "\$ & \$", msresult[4], "\$\\\\")
println("\\hline")
msresult = L3.mstycznych(f, pf, 7.0, delta, epsilon, 100)
println("\$", 7.0, "\$ & \$", msresult[1], "\$ & \$", msresult[2], "\$ & \$", msresult[3], "\$ & \$", msresult[4], "\$\\\\")
println("\\hline")
msresult = L3.mstycznych(f, pf, 8.0, delta, epsilon, 100)
println("\$", 8.0, "\$ & \$", msresult[1], "\$ & \$", msresult[2], "\$ & \$", msresult[3], "\$ & \$", msresult[4], "\$\\\\")
println("\\hline")
msresult = L3.mstycznych(f, pf, 13.0, delta, epsilon, 100)
println("\$", 13.0, "\$ & \$", msresult[1], "\$ & \$", msresult[2], "\$ & \$", msresult[3], "\$ & \$", msresult[4], "\$\\\\")
println("\\hline\n")

msiresultf1 = L3.msiecznych(f, 0.0, 2.0, delta, epsilon, 100)
msiresultf2 = L3.msiecznych(f, 0.0, 1.0, delta, epsilon, 100)
msiresultf3 = L3.msiecznych(f, -1.0, 0.0, delta, epsilon, 100)
msiresultf4 = L3.msiecznych(f, 2.0, 3.0, delta, epsilon, 100)
msiresultf5 = L3.msiecznych(f, -5.0, 5.0, delta, epsilon, 100)

println("\\hline")
println("\$x_{0}\$ & \$x_{1}\$ & r & f(r) & iteracje & errorcode\\\\")
println("\\hline")
println("\$", 0.0, "\$ & \$", 2.0, "\$ & \$", msiresultf1[1],  "\$ & \$", msiresultf1[2], "\$ & \$", msiresultf1[3], "\$ & \$", msiresultf1[4], "\$\\\\")
println("\\hline")
println("\$", 0.0, "\$ & \$", 1.0, "\$ & \$", msiresultf2[1],  "\$ & \$", msiresultf2[2], "\$ & \$", msiresultf2[3], "\$ & \$", msiresultf2[4], "\$\\\\")
println("\\hline")
println("\$", -1.0, "\$ & \$", 0.0, "\$ & \$", msiresultf3[1],  "\$ & \$", msiresultf3[2], "\$ & \$", msiresultf3[3], "\$ & \$", msiresultf3[4], "\$\\\\")
println("\\hline")
println("\$", 2.0, "\$ & \$", 3.0, "\$ & \$", msiresultf4[1],  "\$ & \$", msiresultf4[2], "\$ & \$", msiresultf4[3], "\$ & \$", msiresultf4[4], "\$\\\\")
println("\\hline")
println("\$", -5.0, "\$ & \$", 5.0, "\$ & \$", msiresultf5[1],  "\$ & \$", msiresultf5[2], "\$ & \$", msiresultf5[3], "\$ & \$", msiresultf5[4], "\$\\\\")
println("\\hline\n")


mbresultg = L3.mbisekcji(g, -0.5, 0.5, delta, epsilon)
mbresultg2 = L3.mbisekcji(g, -0.5, 0.0, delta, epsilon)
mbresultg3 = L3.mbisekcji(g, 0.0, 0.5, delta, epsilon)
println("\\hline")
println("przedział & r & g(r) & iteracje & errorcode\\\\")
println("\\hline")
println("\$[-0.5,0.5]\$ & \$", mbresultg[1], "\$ & \$", mbresultg[2],  "\$ & \$", mbresultg[3], "\$ & \$", mbresultg[4], "\$\\\\")
println("\\hline")
println("\$[-0.5,0]\$ & \$", mbresultg2[1], "\$ & \$", mbresultg2[2],  "\$ & \$", mbresultg2[3], "\$ & \$", mbresultg2[4], "\$\\\\")
println("\\hline")
println("\$[0,0.5]\$ & \$", mbresultg3[1], "\$ & \$", mbresultg3[2],  "\$ & \$", mbresultg3[3], "\$ & \$", mbresultg3[4], "\$\\\\")
println("\\hline \n")

println("\\hline")
println("\$x_{0} \$ & r & g(r) & iteracje & errorcode\\\\")
for i = -1:0.25:1
    msresult = L3.mstycznych(g, pg, i, delta, epsilon, 100)
    println("\\hline")
    println("\$", i, "\$ & \$", msresult[1], "\$ & \$", msresult[2],  "\$ & \$", msresult[3], "\$ & \$", msresult[4], "\$\\\\")
end

msresult = L3.mstycznych(g, pg, 2.0, delta, epsilon, 100)
println("\\hline")
println("\$", 2.0, "\$ & \$", msresult[1], "\$ & \$", msresult[2],  "\$ & \$", msresult[3], "\$ & \$", msresult[4], "\$\\\\")
msresult = L3.mstycznych(g, pg, 15.0, delta, epsilon, 100)
println("\\hline")
println("\$", 15.0, "\$ & \$", msresult[1], "\$ & \$", msresult[2],  "\$ & \$", msresult[3], "\$ & \$", msresult[4], "\$\\\\")
println("\\hline\n")

msiresultg1 = L3.msiecznych(g, -1.0, 1.0, delta, epsilon, 100)
msiresultg2 = L3.msiecznych(g, -0.5, 0.5, delta, epsilon, 100)
msiresultg3 = L3.msiecznych(g, 0.0, 1.0, delta, epsilon, 100)

println("\\hline")
println("\$x_{0}\$ & \$x_{1}\$ & r & f(r) & iteracje & errorcode\\\\")
println("\\hline")
println("\$", -1.0, "\$ & \$", 1.0, "\$ & \$", msiresultg1[1], "\$ & \$", msiresultg1[2], "\$ & \$", msiresultg1[3], "\$ & \$", msiresultg1[4], "\$\\\\")
println("\\hline")
println("\$", -0.5, "\$ & \$", 0.5, "\$ & \$", msiresultg2[1],  "\$ & \$", msiresultg2[2], "\$ & \$", msiresultg2[3], "\$ & \$", msiresultg2[4], "\$\\\\")
println("\\hline")
println("\$", 0.0, "\$ & \$", 1.0, "\$ & \$", msiresultg3[1],  "\$ & \$", msiresultg3[2], "\$ & \$", msiresultg3[3], "\$ & \$", msiresultg3[4], "\$\\\\")
println("\\hline")
