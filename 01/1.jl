# Find the sum of all the multiples of 3 or 5 below 1000.

sum_to(n) = n * (n + 1) / 2

sum_steps(step, limit) = step * sum_to(floor((limit - 1) / step))

println(sum_steps(3, 1000) + sum_steps(5, 1000) - sum_steps(15, 1000))
