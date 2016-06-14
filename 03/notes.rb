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

def factor2(n)
  n /= 2 while n.even?
  i = 3
  while i * i < n # this is faster than square root because just uses integers
    # not faster in js, prolly due to no float/int distiction
    n /= i while n % i == 0
    i += 2
  end
  n
end

require 'benchmark'

trials = 1000
number = 600851475143

Benchmark.bmbm do |bm|
  bm.report('main') do
    trials.times { large_divisor(number) }
  end
  bm.report('old') do
    trials.times { large_divisor2(number) }
  end
  bm.report('oldest') do
    trials.times { large_divisor3(number) }
  end
  bm.report('built in prime division') do
    trials.times { Prime.prime_division(number).last }
  end
  # bm.report('factor r') do
  #   trials.times { factor_r(number) }
  # end
  # bm.report('factor l') do
  #   trials.times { factor_l(number) }
  # end
  bm.report('factor new') do
    trials.times { factor_new(number) }
  end
  bm.report('factor 2') do
    trials.times { factor2(number) }
  end
end

# Rehearsal -----------------------------------------------------------
# main                     13.820000   0.000000  13.820000 ( 13.833160)
# old                      27.710000   0.000000  27.710000 ( 27.721971)
# oldest                   56.450000   0.000000  56.450000 ( 56.498406)
# built in prime division   0.120000   0.000000   0.120000 (  0.123992)
# factor new                0.080000   0.000000   0.080000 (  0.073495)
# factor 2                  0.040000   0.000000   0.040000 (  0.047078)
# ------------------------------------------------- total: 98.220000sec
#
#                               user     system      total        real
# main                     13.580000   0.000000  13.580000 ( 13.586276)
# old                      27.310000   0.010000  27.320000 ( 27.357927)
# oldest                   63.680000   0.010000  63.690000 ( 63.848952)
# built in prime division   0.200000   0.000000   0.200000 (  0.202958)
# factor new                0.090000   0.000000   0.090000 (  0.090821)
# factor 2                  0.040000   0.000000   0.040000 (  0.046380)
