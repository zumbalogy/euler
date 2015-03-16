# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?

function factor(n)
  while n % 2 == 0
    n /= 2
  end
  i = 3
  while i < sqrt(n)
    while n % i == 0
      n /= i
    end
    i += 2
  end
  n
end

println(factor(600851475143))
# 6857.0
