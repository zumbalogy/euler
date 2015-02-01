# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

output = nil

(1..500).each do |a|
  (a..500).each do |b|
    c = Math.sqrt(a.abs2 + b.abs2)
    next unless a + b + c == 1000
    output = a * b * c
    break
  end
  break if output
end

p output

# 200
# 375
# 425
# ==
# 31_875_000

(1..500).each do |a|
  (a..500).each do |b|
    b_sq = (1000 - a - b).abs2 - a.abs2
    next unless b_sq > 0
    next unless b_sq == b.abs2
    output = a * b * Math.sqrt(a.abs2 + b.abs2)
    break
  end
  break if output
end

p output

# 31875000.0
