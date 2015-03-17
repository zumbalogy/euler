# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10,001st prime number?

function prime(n)
  for i = 3:2:sqrt(n)
    n % i == 0 && return false
  end
  true
end


function nth_prime(n)
  i = 1
  while n > 1
    i += 2
    prime(i) && (n -= 1)
  end
  i
end

println(nth_prime(10001))
# 104743
