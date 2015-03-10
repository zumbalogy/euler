# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?


require 'prime'


# enabling tail call optimization deos not seem to do much in terms of benchamraks from what i can tell.
# also, maybe could do something funny with knowing when its gonna be odd vs even
def factor_r(n)
  return n if Prime.prime?(n)
  return factor(n / 2) if n % 2 == 0
  a = 3.0
  a += 2 until (n / a) % 1 == 0
  factor_r(n / a)
end

def factor_l(n)
  until Prime.prime?(n)
    n /= 2 if n % 2 == 0
    a = 3.0
    a += 2 until (n / a) % 1 == 0
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
# main                      1.120000   0.000000   1.120000 (  1.131223)
# old                       2.370000   0.010000   2.380000 (  2.373999)
# oldest                    5.430000   0.030000   5.460000 (  5.471746)
# built in prime division   0.020000   0.000000   0.020000 (  0.013713)
# factor r                  0.050000   0.000000   0.050000 (  0.049843)
# factor l                  0.050000   0.000000   0.050000 (  0.053907)
# -------------------------------------------------- total: 9.080000sec
#
#                               user     system      total        real
# main                      1.160000   0.000000   1.160000 (  1.161766)
# old                       2.270000   0.000000   2.270000 (  2.273994)
# oldest                    4.840000   0.010000   4.850000 (  4.841038)
# built in prime division   0.010000   0.000000   0.010000 (  0.010607)
# factor r                  0.030000   0.000000   0.030000 (  0.031273)
# factor l                  0.030000   0.000000   0.030000 (  0.030853)
