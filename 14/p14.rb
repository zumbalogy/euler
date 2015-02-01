# The following iterative sequence is defined for the set of positive integers:
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.

def col_step(n)
  return n / 2 if n.even?
  (3 * n) + 1
end

def col_count(n, total = 1)
  return total unless n > 1
  col_count(col_step(n), total + 1) # TODO: benchmark this versus a loop
end

best = 0
best_start = 0

1_000_000.times do |i|
  foo = col_count(i)
  next unless foo > best
  best = foo
  best_start = i
end

puts best_start
# 837,799
# with a 525 is best col count
