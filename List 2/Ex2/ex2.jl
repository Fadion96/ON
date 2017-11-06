using Plots
tmin = -50
tmax = 50
f(x) = exp(x) * log(1+exp(-x))
plotlyjs()
plot(f, label= "e^x*ln(1 + e^-x)",color= :black,tmin,tmax)
