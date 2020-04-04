# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def triplet_of_sum(sum)
  (1..sum).each do |a|
    b = a
    while b < sum - b
      c = Math.sqrt(a.abs2 + b.abs2)
      return a * b * c if a + b + c == 1000
      b += 1
    end
  end
end

puts triplet_of_sum(1000).to_i
# 31875000
# 200 375 425
