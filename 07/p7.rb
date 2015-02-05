# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10,001st prime number?

def prime?(input)
  i = 3
  limit = Math.sqrt(input).ceil
  until i > limit
    return false if input % i == 0
    i += 2
  end
  true
end

def nth_prime(n)
  i = 1
  until n == 1
    i += 2
    n -=1 if prime?(i)
  end
  i
end

puts nth_prime(10001)
# 104743
