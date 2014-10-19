# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

total = 0

(1..1000).each do |i|
  total += i ** i
  total %= 100000000000
end

puts total
# 9110846700
