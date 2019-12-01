# Given a 2d grid map of '1's (land) and '0's (water), count the number of islands.
# An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.
# You may assume all four edges of the grid are all surrounded by water.

# Example 1:
# Input:
# 11110
# 11010
# 11000
# 00000
# Output: 1

# Example 2:
# Input:
# 11000
# 11000
# 00100
# 00011
# Output: 3

def sink(y, x, grid)
  return if grid[y][x] == 0
  grid[y][x] = 0
  sink(y - 1, x, grid) if y > 0
  sink(y, x - 1, grid) if x > 0
  sink(y + 1, x, grid) if y < grid.length - 1
  sink(y, x + 1, grid) if x < grid[y].length - 1
end

def islands(grid)
  tally = 0
  grid.each_with_index do |row, y|
    row.each_with_index do |col, x|
      if col == 1
        sink(y, x, grid)
        tally += 1
      end
    end
  end
  tally
end

puts islands([
  [1,1,1,1,0],
  [1,1,0,1,0],
  [1,1,0,0,0],
  [0,0,0,0,0]
])

puts islands([
  [1,1,0,0,0],
  [1,1,0,0,0],
  [0,0,1,0,0],
  [0,0,0,1,1]
])
