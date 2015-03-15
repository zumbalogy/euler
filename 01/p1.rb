# Find the sum of all the multiples of 3 or 5 below 1000.

def sum_under(n)
  n * (n + 1) / 2
end

def sum_steps(step, limit)
  step * sum_under((limit - 1) / step)
end

puts sum_steps(3, 1000) + sum_steps(5, 1000) - sum_steps(15, 1000)
# 233168
