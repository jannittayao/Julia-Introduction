using Plots
gr()

function f(t)
    f = cos(2.0*pi*t) + 0.1*randn(1)[1];
end

# manually calculate diffeq
function manual_soln(min, max, step)
    #timestep
    delta_t = step
    max_t = max
    t = min
    nstep_t = max_t/delta_t
    x_init = 0

    #create time step array
    time = collect(t:delta_t:max_t)
    #empty array for X(t) values
    xArray = Float64[]
    push!(xArray, 0) #adds X(0) value to xArray


    #Euler method (efficient)
    let inner_t = t, x = x_init # let deals with for loop scope in julia
        for n = 1:nstep_t
            #increment t by 0.1
            inner_t += delta_t

            #find X'(t) and add it to drvArray
            drv = f(inner_t)
            println(drv)

            #find X(t) and add it to xArray
            x += drv * delta_t
            push!(xArray, x)
        end
    end
    manualPlotArray = [time, xArray]
    return manualPlotArray
end

#Euler method (original + less efficient)
# solns = zeros(size(time)[1]);
# for i = 2:size(time)[1]
#     solns[i] = solns[i-1] + 0.1 * xArray[i-1]
# end

#plot
testplot = manual_soln(0, 10, 0.1)
plot(testplot[1], testplot[2])
xlabel!("Time (s)")
ylabel!("X(t)")
