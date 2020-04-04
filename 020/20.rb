# n! means n × (n − 1) × ... × 3 × 2 × 1

# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

# Find the sum of the digits in the number 100!

def sum_digits(input)
  input.to_s.chars.reduce(0) { |a, b| a + b.to_i }
end

total = sum_digits((2..100).reduce(1, &:*))

puts total
# 648


# p (2..100).reduce(1, &:*)
# p (2..100).reduce(1, &:*).to_s.chars.reduce(0) {|a, b| a + b.to_i}
