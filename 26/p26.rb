# A unit fraction contains 1 in the numerator.
# The decimal representation of the unit fractions with denominators 2 to 10 are given:

# 1/2  = 0.5
# 1/3  = 0.(3)
# 1/4  = 0.25
# 1/5  = 0.2
# 1/6  = 0.1(6)
# 1/7  = 0.(142857)
# 1/8  = 0.125
# 1/9  = 0.(1)
# 1/10 = 0.1

# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle.
# It can be seen that 1/7 has a 6-digit recurring cycle.

# Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

def loop_len(x)
  i = 1
  tail = x[-i]
  len = x.length
  while x[0..len - i - 1].index(tail)
    i += 1
    tail = x[(len - i)..-1]
  end
  tail.length - 1
end

best = 0

(1..1001).each do |t|
  current = loop_len((1.0 / t).to_s)
  if current > best
    best = current
  end
end

# 0.09009009009009009

# this is subject to being fooled by not realizing its the end of the loop. it thinks this has a loop length of 9
# to fix this, i could check in the loop to make sure the number of non-overlapping matches does not decrease
