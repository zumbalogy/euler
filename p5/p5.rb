# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def gcd(a, b)
  b.zero? ? a : gcd(b, a % b)
end

def lcm(a, b)
  (a * b) / gcd(a, b)
end

p (11..20).reduce(&:lcm)
# 232792560

