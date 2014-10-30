# Let d(n) equal the sum of divisors of n.

# If d(a) = b and d(b) = a and a ≠ b, then a and b are amicable.

# The divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; so d(220) = 284.
# The divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Sum all amicable numbers under 10_000.

def sum_div input
    # one counts as a divisor, but input does not
    (2..Math.sqrt(input)).reduce(1) do |a,b|
        input % b == 0 ? a + b + (input / b) : a
    end
end

def amicable input
    first = sum_div(input)
    input == sum_div(first) && input != first
end

puts (2..10_000).reduce(0) { |a,b| amicable(b) ? a + b : a }
# 31_626

# hitting all the pairs twice, but not that many pairs, so might be faster just doing this
# and probably cleaner

# could kinda cheat and not care about a number if its sum_div is over 10_000
# but its kinda a hack and less clean

###############################################################

require 'benchmark'

Benchmark.bmbm do |bm|

    bm.report('inject') do
        (2..10_000).inject(0) { |a,b| amicable(b) ? a + b : a }
    end

    bm.report('each') do
        total = 0
        (2..10_000).each do |v|
            total += v if amicable v
        end
    end
end


# Rehearsal ------------------------------------------
# inject   0.440000   0.000000   0.440000 (  0.441368)
# each     0.440000   0.000000   0.440000 (  0.439893)
# --------------------------------- total: 0.880000sec

#              user     system      total        real
# inject   0.440000   0.000000   0.440000 (  0.438448)
# each     0.440000   0.000000   0.440000 (  0.439485)
