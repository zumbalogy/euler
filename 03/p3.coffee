# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?

isPrime = (n) ->
  i = 3
  while i < Math.sqrt(n)
    return false if n % i == 0
    i += 2
  true

factor = (n) ->
  until isPrime(n)
    n /= 2 if n % 2 == 0
    a = 3
    a += 2 until n % a == 0
    n /= a
  n

console.log(factor(600851475143))
# 6857
