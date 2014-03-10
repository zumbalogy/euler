# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

def col_count input
    total = 1
    current = input
    until current == 1
        if current.even?
            current = current / 2
        else
            current = (3 * current) + 1
        end
        total += 1
    end
    total
end

best = 0
best_start = 0

(1..1_000_000).each do |i|
    foo = col_count(i)
    if foo > best
        best = foo
        best_start = i
    end
end

puts best_start
# 837_799
# with a 525 is best col count
