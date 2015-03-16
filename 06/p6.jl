# The sum of the squares of the first ten natural numbers is,

# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,

# (1 + 2 + ... + 10)^2 = 55^2 = 3025
# delta for sum of the squares of first ten natural numbers and square of the sum is 3025 − 385 = 2640

# Find delta for sum of  squares of the first one hundred natural numbers and square of the sum

sq_sum(n) = ((n / 2) * (n + 1)) ^ 2

sum_sq(n) = n * (n + 1) * (n * 2 + 1) / 6

println(sq_sum(100) - sum_sq(100))
# 25164150
