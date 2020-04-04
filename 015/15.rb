# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

# How many such routes are there through a 20×20 grid?

def combination(from, take)
  (2..from).reduce(:*) / ((2..take).reduce(:*) * (2..(from - take)).reduce(:*))
end

puts combination(40, 20)
# 137846528820
