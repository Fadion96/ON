import L3

f = (x -> sin(x) - (0.5 * x )^2.0)
pf = (x -> cos(x) - 0.5*x)
delta = 0.5 * 10.0 ^ -5
epsilon = 0.5 * 10.0 ^ -5

mbresult = L3.mbisekcji(f, 1.5, 2.0, delta, epsilon)
msresult = L3.mstycznych(f, pf, 1.5, delta, epsilon, 100)
msiresult = L3.msiecznych(f, 1.0, 2.0, delta, epsilon, 100)

println("\\hline")
println("Metoda & r & f(r) & iteracje & errorcode\\\\")
println("\\hline")
println("Bisekcji & \$", mbresult[1], "\$ & \$", mbresult[2], "\$ & \$", mbresult[3], "\$ & \$", mbresult[4], "\$\\\\")
println("\\hline")
println("Newtona & \$", msresult[1],  "\$ & \$", msresult[2], "\$ & \$",msresult[3], "\$ & \$",msresult[4], "\$\\\\")
println("\\hline")
println("Siecznych & \$", msiresult[1],  "\$ & \$", msiresult[2], "\$ & \$", msiresult[3], "\$ & \$", msiresult[4], "\$\\\\")
println("\\hline")
