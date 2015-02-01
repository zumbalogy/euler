# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10,001st prime number?

def next_prime(input)
  input += 2
  input += 2 until prime?(input)
  input
end

def prime?(input)
  i = 3
  limit = Math.sqrt(input).ceil
  until i > limit
    return false if input % i == 0
    i += 2
  end
  return true
end

i = 3
9999.times { i = next_prime(i) }

puts i
# 104743
