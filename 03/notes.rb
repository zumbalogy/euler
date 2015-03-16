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

def factor_new(n)
  n /= 2 while n % 2 == 0
  i = 3
  while i < Math.sqrt(n)
    n /= i while n % i == 0
    i += 2
  end
  n
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
  bm.report('factor new') do
    100.times { factor_new(600851475143) }
  end
end

# Rehearsal -----------------------------------------------------------
# main                      1.080000   0.000000   1.080000 (  1.086730)
# old                       2.170000   0.000000   2.170000 (  2.177371)
# oldest                    4.420000   0.000000   4.420000 (  4.424136)
# built in prime division   0.010000   0.000000   0.010000 (  0.010196)
# factor r                  0.020000   0.000000   0.020000 (  0.028859)
# factor l                  0.030000   0.000000   0.030000 (  0.027993)
# factor new                0.020000   0.000000   0.020000 (  0.019184)
# -------------------------------------------------- total: 7.750000sec
#
#                               user     system      total        real
# main                      1.090000   0.000000   1.090000 (  1.091288)
# old                       2.150000   0.000000   2.150000 (  2.153649)
# oldest                    4.390000   0.000000   4.390000 (  4.390910)
# built in prime division   0.010000   0.000000   0.010000 (  0.010043)
# factor r                  0.020000   0.000000   0.020000 (  0.028300)
# factor l                  0.020000   0.000000   0.020000 (  0.028111)
# factor new                0.020000   0.000000   0.020000 (  0.018983)
