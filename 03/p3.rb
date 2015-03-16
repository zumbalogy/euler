# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?

# TODO: benchmark in the notes

def factor(n)
  n /= 2 while n % 2 == 0
  i = 3
  while i < Math.sqrt(n)
    n /= i while n % i == 0
    i += 2
  end
  n
end

puts factor(600851475143)
# 6857
