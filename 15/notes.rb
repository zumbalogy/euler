# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

# How many such routes are there through a 20×20 grid?

def combination(from, take)
  diff = from - take
  a, b, c = [from, take, diff].sort
  hash = {}
  hash[a] = (2..a).reduce(:*)
  hash[b] ||= hash[a] * (((a + 1)..b).reduce(:*) || 1)
  hash[c] ||= hash[b] * (((b + 1)..c).reduce(:*) || 1)
  hash[from] / (hash[take] * hash[diff])
end

puts combination(40, 20)
# 137846528820
