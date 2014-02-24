# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

require 'prime'

def divisors input
    count = 1
    until count * count > input
        if input % count == 0 && (Prime.prime?(count) || count == 1)
            output = count
        end
        count += 1
    end
    output
end



puts divisors(29)
puts divisors(13195)
puts divisors(600851475143)