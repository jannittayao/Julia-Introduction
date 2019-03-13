using DifferentialEquations, Plots

f(u, p, t) = (cos(2*pi*t)+randn(1)[1])
u0 = 0.0
tspan = (0.0, 10.0)
prob = ODEProblem(f, u0, tspan)
soln = solve(prob)

plot(soln,linewidth=1,title="Solution to the ODE",
     xaxis="Time (s)",yaxis="X(t)") # legend=false
