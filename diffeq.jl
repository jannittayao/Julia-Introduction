using DifferentialEquations, Plots
gr()

# manually calculate diffeq
time = collect(0:0.1:10)
solns_manual = Float64[]


for t in time
    t = ((sin(2*pi*t)/(2*pi)) + (randn(1)[1] * 0.1*time))
    push!(solns_manual, t)
end

# using DifferentialEquations package to calculate diffeq
f(u, p, t) = cos(2*pi*t)
u0 = 0.0
tspan = (0.0, 10.0)
prob = ODEProblem(f, u0, tspan)
soln_diffeq = solve(prob)

# Calculating diffeq analytically
solns_analytical = Float64[]

for t in time
    t = ((sin(2*pi*t)/(2*pi)))
    push!(solns_analytical, t)
end


plot(soln_diffeq,linewidth=1,title="Solution to the ODE",
     xaxis="Time (s)",yaxis="X(t)", label="diffeq")
plot!(time, solns_manual, linewidth = 1, label="manual soln")
plot!(time, solns_analytical, linewidth = 1, label = "analytical soln")
