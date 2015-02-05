# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4
# As 1 = 1^4 is not a sum it is not included.

# The sum of these numbers is 1634 + 8208 + 9474 = 19316.

# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

def sum_of_digits_to_5th?(input)
  input == input.to_s.each_char.reduce(0) { |a, b| a + (b.to_i ** 5) }
end

puts (2..999999).reduce(0) { |a, b| sum_of_digits_to_5th?(b) ? a + b : a }
# 443839
# from: 4150 4151 54748 92727 93084 194979
