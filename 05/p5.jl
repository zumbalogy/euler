# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

gcd(a, b) = b == 0 ? a : gcd(b, a % b)

lcm(a, b) = (a * b) / gcd(a, b)

println(reduce(lcm, 11:20))
# 232792560
