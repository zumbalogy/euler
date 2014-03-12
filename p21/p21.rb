# Let d(n) equal the sum of divisors of n.

# If d(a) = b and d(b) = a, where a ≠ b, then a and b are called amicable numbers.

# For example, the divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; so d(220) = 284. The divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.



def sum_div input
    (2..Math.sqrt(input)).inject(1) do |a,b| 
        input % b == 0 ? a + b + (input / b) : a
    end
end

array = []

(2..10_000).each do |a|
    first = sum_div(a)
    b = sum_div(first)
    if a == b && a != first
        array << a
    end
end

puts array.reduce(:+)
# 31626