# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.



(1...1_000).each do |a|
    (1...(a * 2)).each do |b|
        c = Math.sqrt((a**2) + (b**2))
        if a + b + c == 1000
            puts a*b*c
            exit
        end
    end
end

# 200
# 375
# 425
# ==
# 31_875_000
