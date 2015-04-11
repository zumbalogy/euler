# The following iterative sequence is defined for the set of positive integers:
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# This sequence has 10 terms. It is not proven (Collatz Problem) but it is thought that all numbers go to 1.

# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.

colStep = (n) ->
  return n / 2 if n % 2 == 0
  (3 * n) + 1

colCount = (n) ->
  count = 1
  until n == 1
    n = colStep(n)
    count += 1
  count

bestCount = (limit) ->
  bestScore = 0
  bestStart = 0
  while 1 < limit--
    count = colCount(limit)
    if count > bestScore
      bestStart = limit
      bestScore = count
  bestStart

console.log(bestCount(1000000))
# 837799
