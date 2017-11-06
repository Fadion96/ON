using Polynomials
a=[1, -210.0, 20615.0,-1256850.0,
      53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,
      11310276995381.0, -135585182899530.0,
      1307535010540395.0,     -10142299865511450.0,
      63030812099294896.0,     -311333643161390640.0,
      1206647803780373360.0,     -3599979517947607200.0,
      8037811822645051776.0,      -12870931245150988800.0,
      13803759753640704000.0,      -8752948036761600000.0,
      2432902008176640000.0]

reverse!(a)
P = Poly(a)
p = poly([ i for i in 1.0:20.0])
root = Polynomials.roots(P)
reverse!(root)
println(root)
for i in 1:20
      println(abs(polyval(P,root[i])))
      println(abs(polyval(p,root[i])))
      println(abs(root[i]-i))
end
a2=[1, -210.0 - 2.0^23, 20615.0,-1256850.0,
      53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,
      11310276995381.0, -135585182899530.0,
      1307535010540395.0,     -10142299865511450.0,
      63030812099294896.0,     -311333643161390640.0,
      1206647803780373360.0,     -3599979517947607200.0,
      8037811822645051776.0,      -12870931245150988800.0,
      13803759753640704000.0,      -8752948036761600000.0,
      2432902008176640000.0]
reverse!(a2)
P2 = Poly(a2)
root2 = Polynomials.roots(P2)
reverse!(root2)
println(root2)
for i in 1:20
      println(abs(polyval(P2,root2[i])))
end
