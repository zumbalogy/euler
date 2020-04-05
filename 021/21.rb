# Let d(n) equal the sum of divisors of n.

# If d(a) = b and d(b) = a and a ≠ b, then a and b are amicable.

# The divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; so d(220) = 284.
# The divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Sum all amicable numbers under 10_000.

##########################

# NOTE: d(n) could be larger than 10_000.
# NOTE: The current solution has sum_div doing redundant work.

def sum_div(input)
  # one counts as a divisor, but input does not
  (2..Math.sqrt(input)).reduce(1) do |a, b|
    next a unless input % b == 0
    a + b + (input / b)
  end
end

def amicable?(input)
  first = sum_div(input)
  input != first && input == sum_div(first)
end

amicables = [2] + (2..10_000).select { |x| amicable?(x) }

puts amicables.reduce(:+)
# 31_626
