# n! means n × (n − 1) × ... × 3 × 2 × 1

# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

# Find the sum of the digits in the number 100!

total = (2..100).inject(1) {|a,b| a * b}.to_s.chars.inject(0) {|a, b| a + b.to_i}

puts total
# 648

p (2..100).inject(1) {|a,b| a * b}
