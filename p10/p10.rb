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
# 142913828922
