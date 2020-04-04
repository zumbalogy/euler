# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 2^1000?

puts (2 ** 1_000).to_s.chars.reduce(0) { |a, b| a + b.to_i }

# 1366
# not the most clever solution, but straightforward and short.
