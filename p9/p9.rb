# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.



catch (:done) do # catching might be non-idiomatic
    1_000.times do |a|
        (1_000 - a).times do |b|
            c = Math.sqrt((a**2) + (b**2))
            if a + b + c == 1000 && a*b*c != 0
                puts a*b*c
                throw :done
            end
        end
    end
end

# 200
# 375
# 425
# ==
# 31_875_000