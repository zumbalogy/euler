# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?

require 'prime'

def factor(n)
  return n if Prime.prime?(n)
  return factor(n / 2) if n % 2 == 0
  a = 3.0
  a += 2 until n % a == 0
  factor(n / a)
end

puts factor(600851475143)
# 6857
