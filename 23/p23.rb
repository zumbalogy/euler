# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number. A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28_123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

require 'set'

def abundant?(input)
  sq = Math.sqrt(input)
  sum = 1
  sum += sq if sq.floor == sq
  (2...sq).each do |i|
    sum += i + (input / i) if input % i == 0
    return true if sum > input
  end
  false
end

def total_not_from_abundant_pair
  abundants = (12..28123).select(&method(:abundant?))
  combos = abundants.combination(2)
  sums = combos.map { |(a, b)| a + b }.to_set
  sums += abundants.map { |a| a + a }
  diff = (1..28123).to_set - sums
  diff.reduce(:+)
end

puts total_not_from_abundant_pair
# 4,179,871



