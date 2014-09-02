# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10 001st prime number?

require 'prime'

a = Prime.new

10_000.times do
    a.next
end

puts a.next

# 104743

########################################

def prime? input
  return false if input == 1
  return true if input == 2
  return false if input.even?
  i = 3
  limit = Math.sqrt(input) + 1
  until i > limit
    return false if input % i == 0
    i += 2
  end
  return true
end

count = 0
i = 1

while count < 10000
    i += 2
    prime?(i) && count += 1
end

puts i
# 104743
