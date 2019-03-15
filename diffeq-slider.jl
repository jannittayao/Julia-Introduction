using Interact, Plots

@manipulate for time in 0:0.1:10
   plot([time -> (sin(2*pi*time)/(2*pi)) + (randn(1)[1] * 0.1)], 0, time)
end
