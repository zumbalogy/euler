# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

require 'prime'

puts Prime.each(2000000).reduce(:+)
# 142_913_828_922
