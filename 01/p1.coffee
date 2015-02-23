# Find the sum of all the multiples of 3 or 5 below 1000.

sumUnder = (limit) ->
  limit * (limit + 1) / 2

sumSteps = (step, limit) ->
  step * sumUnder((limit - 1) / step)

console.log(sumSteps(3, 1000) + sumSteps(5, 1000) - sumSteps(15, 1000))
