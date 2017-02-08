# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

require 'prime'

a = Prime.new

sum = 0
save = 0

while save < 2_000_000
  sum += save
  save = a.next
end

puts sum
# 142_913_828_922

#####################

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
total = 2
while i < 2_000_000
  total += i
  i = next_prime(i)
end

puts total

#############################


puts Prime.each(2000000).reduce(:+)


##################

out = 0
Prime.each(2000000) { |p| out += p }
puts out


##############################

# implimenting a sieve might be slower, but fun. could do it with an array of all numbers, then deleteing certain numbers, or with a bitmap and marking non-primes as 1
