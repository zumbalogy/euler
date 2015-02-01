# The sum of the squares of the first ten natural numbers is,

# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,

# (1 + 2 + ... + 10)^2 = 55^2 = 3025
# delta for sum of the squares of first ten natural numbers and square of the sum is 3025 − 385 = 2640

# Find delta for sum of  squares of the first one hundred natural numbers and square of the sum


p (101 * 50).abs2 - (1..100).reduce { |a, b| a + b.abs2 }
# 25164150


p ((101 * 50)**2) - ( (100 * 101 * 201) / 6)


def e6 n
  (((n+1) * (n/2)) ** 2) - ((n * (n+1) * ((2*n) + 1) / 6))
end

puts e6 100

