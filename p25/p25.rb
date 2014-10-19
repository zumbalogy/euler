# The Fibonacci sequence is defined by the recurrence relation:

# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:

# F1 = 1, F2 = 1, F3 = 2, F4 = 3, F5 = 5, F6 = 8,
# F7 = 13, F8 = 21, F9 = 34, F10 = 55, F11 = 89, F12 = 144

# The 12th term, F12, is the first term to contain three digits.

# What is the first term in the Fibonacci sequence to contain 1000 digits?

def count_digits input
  input.to_s.length
end

def next_fibs((a, b))
  [b, a + b]
end

term = 2
fibs = [1, 1]

until count_digits(fibs.last) >= 1000
  fibs = next_fibs fibs
  term += 1
end

puts term
# 4780
