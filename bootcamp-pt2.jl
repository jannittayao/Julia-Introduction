using Plots
gr()

time = collect(0:0.1:10)
solns = Float64[]


for t in time
    t = ((sin(2*pi*t)/(2*pi)) + (randn(1)[1] * t))
    push!(solns, t)
end

plot(time, solns)
xlabel!("Time (s)")
ylabel!("X(t)")
