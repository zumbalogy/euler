# Each new term in the Fibonacci sequence is the sum of the previous 2 terms.
# Starting with 1 and 2, the first 10 terms are:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89

# Sum the even Fibonacci numbers under four million

total = 0
a = 1
b = 2

while b < 4_000_000
  total += b
  c = a + b
  a = b + c
  b = a + c
end

puts total
# 4613732
