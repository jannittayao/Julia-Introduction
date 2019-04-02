using Plots
gr()

function f(t)
    f = cos(2.0*pi*t) + 0.1*rand(1)[1];
end

#timestep
delta_t = 0.1
max_t = 10
t = 0.0
nstep_t = max_t/delta_t
x_init = 0

#create time step array
time = collect(init_t:delta_t:max_t)
#empty array for X(t) values
drvArray = Float64[]
xArray = Float64[]
push!(xArray, 0) #adds X(0) value to xArray


#Euler method (efficient)
let inner_t = t, x = x_init # let deals with for loop scope in julia
    for n = 1:nstep_t
        inner_t += delta_t

        drv = f(inner_t)
        push!(drvArray,drv)

        x += drv
        push!(xArray, x)
    end
end


#Euler method (original + less efficient)
# solns = zeros(size(time)[1]);
# for i = 2:size(time)[1]
#     solns[i] = solns[i-1] + 0.1 * xArray[i-1]
# end

#plot
plot(time, xArray)
xlabel!("Time (s)")
ylabel!("X(t)")
