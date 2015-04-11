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

def col_step(n)
  return n / 2 if n.even?
  (3 * n) + 1
end

def col_count(n)
  count = 0
  until n == 1
    n = col_step(n)
    count += 1
  end
  count
end

def best_count(limit)
  best = 0
  best_start = 0
  (1..limit).each do |i|
    count = col_count(i)
    next unless count > best
    best = count
    best_start = i
  end
  best_start
end

puts best_count(1000000)
# 837799
# count of 525
