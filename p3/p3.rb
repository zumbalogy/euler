# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

require 'prime'
require 'benchmark'

def divisors input
    count = 1
    until count * count > input
        if input % count == 0 && Prime.prime?(count) # || count == 1 # if you want general case
            output = count
        end
        count += 1
    end
    output
end


p divisors(600851475143)

# puts divisors(29)
# puts divisors(13195)
time = Time.now
divisors(600851475143)
puts Time.now - time

puts Benchmark.measure { divisors(600851475143) } 
puts Benchmark.measure { divisors(600851475143) } 
puts Benchmark.measure { divisors(600851475143) } 
puts Benchmark.measure { divisors(600851475143) } 
# the .times loop seems to hit performance

# =>
# 6857
# 0.08573793
#   0.090000   0.000000   0.090000 (  0.085526)
#   0.080000   0.000000   0.080000 (  0.085108)
#   0.090000   0.000000   0.090000 (  0.085430)
#   0.080000   0.000000   0.080000 (  0.085072)

