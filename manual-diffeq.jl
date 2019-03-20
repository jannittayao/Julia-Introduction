using Plots
gr()

time = collect(0:0.1:10)
xArray = Float64[]

function f(t)
    f = cos(2.0*pi*t) + 0.1*rand(1)[1];
end

#f(t) values
for t in time
    push!(xArray, f(t))
end

#Euler method
solns = zeros(size(time)[1]);
for i = 2:size(time)[1]
    solns[i] = solns[i-1] + 0.1 * xArray[i-1]
end

#plot
plot(time, solns)
xlabel!("Time (s)")
ylabel!("X(t)")
