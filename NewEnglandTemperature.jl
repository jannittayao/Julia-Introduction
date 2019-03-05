
using Plots

months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
          "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"]
monthlyMeanVermont = [18.7, 21.5, 31.0, 44.8, 56.3, 65.8, 70.6, 68.8, 60.5,
                    48.1, 38.2, 25.8]
monthlyMeanMaine = [22.3, 25.5, 33.5, 44.0, 53.9, 63.4, 69.1, 68.0, 60.1,
                    48.8, 39.4, 28.8]
monthlyMeanBoston = [29.0, 31.7, 38.3, 48.1, 57.9, 67.7, 73.4, 72.1,
                     64.9, 54.0, 44.7, 34.7]
monthlyMeanConn = [26.1, 29.7, 37.8, 49.4, 59.5, 68.5, 73.6, 71.9, 63.8,
                   52.1, 42.4, 31.6]


temps = [monthlyMeanVermont, monthlyMeanMaine, monthlyMeanBoston, monthlyMeanConn]
meanTemps = zeros(Float64, 12)

for i = 1:length(temps)
    for j = 1:length(temps[i])
        meanTemps[j] += (temps[i][j])
    end
end

for i = 1:length(meanTemps)
    meanTemps[i] = meanTemps[i]/4
end

plot(months, meanTemps,
title = "Mean Monthly Temperature in New England 1981-2010",
label = ["Temp"],
lw = 3)

xlabel!("Month")
ylabel!("Temperature (F)")
