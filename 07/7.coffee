# What is the 10 001st prime number? (not including one)

oddPrime = (n) ->
  limit = Math.sqrt(n)
  i = 3
  while i <= limit
    return false if n % i == 0
    i += 2
  true

nthPrime = (n) ->
  i = 1
  while n > 1
    i += 2
    oddPrime(i) && n--
  i

console.log(nthPrime(10001))
# 104743
