# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?


require 'prime'


# enabling tail call optimization deos not seem to do much in terms of benchamraks from what i can tell.
# also, maybe could do something funny with knowing when its gonna be odd vs even
def factor_r(n)
  return n if Prime.prime?(n)
  return factor(n / 2) if n % 2 == 0
  a = 3.0
  a += 2 until n % a == 0
  factor_r(n / a)
end

def factor_l(n)
  until Prime.prime?(n)
    n /= 2 if n % 2 == 0
    a = 3.0
    a += 2 until n % a == 0
    n /= a
  end
  n
end

def large_divisor(input)
  check = Math.sqrt(input).floor
  check -= 1 if check.even?
  check -= 2 until input % check == 0 && Prime.prime?(check)
  check
end

def large_divisor2(input)
  check = Math.sqrt(input).floor
  check -= 1 until input % check == 0 && Prime.prime?(check)
  check
end

def large_divisor3(input)
  count = 1
  sq = Math.sqrt input
  until count > sq
    output = count if input % count == 0 && Prime.prime?(count)
    count += 1
  end
  output
end

require 'benchmark'

Benchmark.bmbm do |bm|
  bm.report('main') do
    100.times { large_divisor(600851475143) }
  end
  bm.report('old') do
    100.times { large_divisor2(600851475143) }
  end
  bm.report('oldest') do
    100.times { large_divisor3(600851475143) }
  end
  bm.report('built in prime division') do
    100.times { Prime.prime_division(600851475143).last }
  end
  bm.report('factor r') do
    100.times { factor_r(600851475143) }
  end
  bm.report('factor l') do
    100.times { factor_l(600851475143) }
  end
end

# Rehearsal -----------------------------------------------------------
# main                      1.110000   0.000000   1.110000 (  1.113124)
# old                       2.210000   0.000000   2.210000 (  2.208054)
# oldest                    4.450000   0.130000   4.580000 (  4.735318)
# built in prime division   0.020000   0.000000   0.020000 (  0.010385)
# factor r                  0.030000   0.000000   0.030000 (  0.030001)
# factor l                  0.020000   0.000000   0.020000 (  0.028834)
# -------------------------------------------------- total: 7.970000sec
#
#                               user     system      total        real
# main                      1.050000   0.110000   1.160000 (  1.245469)
# old                       2.120000   0.290000   2.410000 (  2.559784)
# oldest                    4.480000   0.010000   4.490000 (  4.480815)
# built in prime division   0.010000   0.000000   0.010000 (  0.010093)
# factor r                  0.030000   0.000000   0.030000 (  0.029270)
# factor l                  0.030000   0.000000   0.030000 (  0.028461)
