# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.


# How many such routes are there through a 20×20 grid?

###############################

# every route will be 40 units long
# every route will have 20 rights and 20 downs
# so, the question is 40c20. 
# also, is how many 40 digit long binary numbers exist

# the combination formula is
#   a! / b!(a-b)!


def combination foo, bar
    (2..foo).reduce(:*) / ((2..bar).reduce(:*) * (2..(foo-bar)).reduce(:*))
end

puts combination 40, 20
# => 137846528820