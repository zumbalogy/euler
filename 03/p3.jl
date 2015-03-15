# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?

function is_prime(n)
  n % 2 == 0 && return false
  for i = 3:2:sqrt(n)
    n % i == 0 && return false
  end
  true
end


function factor(n)
  while !is_prime(n)
    if n % 2 == 0
      n /= 2
    end
    a = 3
    while n % a > 0
      a += 2
    end
    n /= a
  end
  n
end

println(factor(600851475143))
# 6857.0
