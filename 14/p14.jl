# The following iterative sequence is defined for the set of positive integers:
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# This sequence has 10 terms. It is not proven (Collatz Problem) but it is thought that all numbers go to 1.
#
# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.

c_step(n) = n % 2 == 0 ? n / 2 : (3 * n) + 1

function c_count(n, count = 1)
  n == 1 && return count
  c_count(c_step(n), count + 1)
end

function best_count(limit)
  best = 0
  start = 0
  for i in 1:limit
    count = c_count(i)
    if count > best
      best = count
      start = i
    end
  end
  start
end

println(best_count(1000000))
# 837799
# count of 525
