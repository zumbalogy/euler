# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?

require 'prime'

def large_divisor(input)
  check = Math.sqrt(input).floor
  check -= 1 if check.even?
  check -= 2 until input % check == 0 && Prime.prime?(check)
  check
end

p large_divisor(600851475143)
# 6857

require 'benchmark'

def large_divisor2(input)
  check = Math.sqrt(input).floor
  check -= 1 until input % check == 0 && Prime.prime?(check)
  check
end

Benchmark.bmbm do |bm|
  bm.report('main') do
    100.times { large_divisor(600851475143) }
  end
  bm.report('old') do
    100.times { large_divisor2(600851475143) }
  end
end
