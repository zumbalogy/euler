# Find the sum of all the multiples of 3 or 5 below 1000.

def sum_steps(step, limit)
  (0...limit).step(step).reduce(:+)
end

p sum_steps(3, 1000) + sum_steps(5, 1000) - sum_steps(15, 1000)
# 233168
