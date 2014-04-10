# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

output = 0

(1..500).each do |a|
    (a..500).each do |b|
        c = Math.sqrt((a**2) + (b**2))
        if a + b + c == 1000
            output =  a*b*c
            break
        end
    end
    break if output > 0
end

p output

# 200
# 375
# 425
# ==
# 31_875_000
