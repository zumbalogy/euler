# What is the greatest product of four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 20×20 grid?

grid = [[ 8, 2,22,97,38,15, 0,40, 0,75, 4, 5, 7,78,52,12,50,77,91, 8],
        [49,49,99,40,17,81,18,57,60,87,17,40,98,43,69,48, 4,56,62, 0],
        [81,49,31,73,55,79,14,29,93,71,40,67,53,88,30, 3,49,13,36,65],
        [52,70,95,23, 4,60,11,42,69,24,68,56, 1,32,56,71,37, 2,36,91],
        [22,31,16,71,51,67,63,89,41,92,36,54,22,40,40,28,66,33,13,80],
        [24,47,32,60,99, 3,45, 2,44,75,33,53,78,36,84,20,35,17,12,50],
        [32,98,81,28,64,23,67,10,26,38,40,67,59,54,70,66,18,38,64,70],
        [67,26,20,68, 2,62,12,20,95,63,94,39,63, 8,40,91,66,49,94,21],
        [24,55,58, 5,66,73,99,26,97,17,78,78,96,83,14,88,34,89,63,72],
        [21,36,23, 9,75, 0,76,44,20,45,35,14, 0,61,33,97,34,31,33,95],
        [78,17,53,28,22,75,31,67,15,94, 3,80, 4,62,16,14, 9,53,56,92],
        [16,39, 5,42,96,35,31,47,55,58,88,24, 0,17,54,24,36,29,85,57],
        [86,56, 0,48,35,71,89, 7, 5,44,44,37,44,60,21,58,51,54,17,58],
        [19,80,81,68, 5,94,47,69,28,73,92,13,86,52,17,77, 4,89,55,40],
        [ 4,52, 8,83,97,35,99,16, 7,97,57,32,16,26,26,79,33,27,98,66],
        [88,36,68,87,57,62,20,72, 3,46,33,67,46,55,12,32,63,93,53,69],
        [ 4,42,16,73,38,25,39,11,24,94,72,18, 8,46,29,32,40,62,76,36],
        [20,69,36,41,72,30,23,88,34,62,99,69,82,67,59,85,74, 4,36,16],
        [20,73,35,29,78,31,90, 1,74,31,49,71,48,86,81,16,23,57, 5,54],
        [ 1,70,54,71,83,51,54,69,16,92,33,48,61,43,52, 1,89,19,67,48]]

best = 0

limit = grid.length - 3

grid.each_with_index do |row, row_idx|
  row.each_with_index do |cell, cell_idx|

    if cell_idx < limit
      right = cell * row[cell_idx + 1] * row[cell_idx + 2] * row[cell_idx + 3]
    end

    if row_idx < limit
      down = cell * grid[row_idx + 1][cell_idx] * grid[row_idx + 2][cell_idx] * grid[row_idx + 3][cell_idx]
    end

    if cell_idx < limit && row_idx < limit
      diag_r = cell * grid[row_idx + 1][cell_idx + 1] * grid[row_idx + 2][cell_idx + 2] * grid[row_idx + 3][cell_idx + 3]
    end

    if cell_idx > 3 && row_idx < limit
      diag_l = cell * grid[row_idx + 1][cell_idx - 1] * grid[row_idx + 2][cell_idx - 2] * grid[row_idx + 3][cell_idx - 3]
    end

    best = [best, right, down, diag_r, diag_l].compact.max

  end
end

puts best
# 70600674


#################################################

best = 0

limit = grid.length - 3

grid.each_with_index do |row, y|
  row.each_with_index do |cell, x|
    right = row[x + 1] *
            row[x + 2] *
            row[x + 3] if x < limit
    down = grid[y + 1][x] *
           grid[y + 2][x] *
           grid[y + 3][x] if y < limit
    diag_r = grid[y + 1][x + 1] *
             grid[y + 2][x + 2] *
             grid[y + 3][x + 3] if x < limit && y < limit
    diag_l = grid[y + 1][x - 1] *
             grid[y + 2][x - 2] *
             grid[y + 3][x - 3] if x > 3 && y < limit
    local_best = [0, right, down, diag_r, diag_l].compact.map { |i| i * cell }.max
    best = [best, local_best].max
  end
end

puts best


############################################################


best = 0

limit = grid.length - 3

grid.each_with_index do |row, y|
  row.each_with_index do |cell, x|
    if x < limit
      right = cell *
              row[x + 1] *
              row[x + 2] *
              row[x + 3]
      diag_r = cell *
               grid[y + 1][x + 1] *
               grid[y + 2][x + 2] *
               grid[y + 3][x + 3] if y < limit
    end
    if y < limit
      down = cell *
             grid[y + 1][x] *
             grid[y + 2][x] *
             grid[y + 3][x]
      diag_l = cell *
               grid[y + 1][x - 1] *
               grid[y + 2][x - 2] *
               grid[y + 3][x - 3] if x > 3
    end
    best = [best, right, down, diag_r, diag_l].compact.max
  end
end

puts best
# 70600674

#############################################################################



best = 0

limit = grid.length - 3

grid.each_with_index do |row, y|
  row.each_with_index do |cell, x|
    right, down, diag_r, diag_l = 1, 1, 1, 1
    4.times do |t|
      right *= row[x + t] if x < limit
      next unless y < limit
      down *= grid[y + t][x]
      diag_r *= grid[y + t][x + t] if x < limit
      diag_l *= grid[y + t][x - t] if x > 3
    end
    best = [best, right, down, diag_r, diag_l].max
  end
end

puts best
# 70600674


################################################################

require 'matrix'

matrix = Matrix[grid]



###########################################################################


best = 0

limit = grid.length - 3

grid.each_with_index do |row, y|
  row.each_with_index do |cell, x|
    y_valid = y < limit
    x_valid = x < limit
    right = [row[x + 1], row[x + 2], row[x + 3]].reduce(cell, :*) if x_valid
    down = [grid[y + 1][x], grid[y + 2][x], grid[y + 3][x]].reduce(cell, :*) if y_valid
    diag_r = [grid[y + 1][x + 1], grid[y + 2][x + 2], grid[y + 3][x + 3]].reduce(cell, :*) if x_valid && y_valid
    diag_l = [grid[y + 1][x - 1], grid[y + 2][x - 2], grid[y + 3][x - 3]].reduce(cell, :*) if x > 3 && y_valid
    best = [best, right, down, diag_r, diag_l].compact.max
  end
end

puts best
# 70600674


############################################################################


best = 0

limit = grid.length - 3

grid.each_with_index do |row, y|
  row.each_with_index do |cell, x|
    y_valid = y < limit
    x_valid = x < limit
    right = row[x + 1..x + 3] if x_valid
    down = [grid[y + 1][x], grid[y + 2][x], grid[y + 3][x]] if y_valid
    diag_r = [grid[y + 1][x + 1], grid[y + 2][x + 2], grid[y + 3][x + 3]] if x_valid && y_valid
    diag_l = [grid[y + 1][x - 1], grid[y + 2][x - 2], grid[y + 3][x - 3]] if x > 3 && y_valid
    current_best = [right, down, diag_l, diag_r].compact.map { |array| array.reduce(cell, :*) }.max
    best = [best, current_best].compact.max
  end
end

puts best
# 70600674



##############################################################################


limit = grid.length - 3

grid.each_with_index do |row, y|
  row.each_with_index do |cell, x|
    y_valid = y < limit
    x_valid = x < limit
    paths = []
    paths << row[x + 1..x + 3] if x_valid
    paths << grid[y + 1..y + 3].map { |row| row[x] } if y_valid
    paths << [grid[y + 1][x + 1], grid[y + 2][x + 2], grid[y + 3][x + 3]] if x_valid && y_valid
    paths << [grid[y + 1][x - 1], grid[y + 2][x - 2], grid[y + 3][x - 3]] if x > 3 && y_valid
    best = paths.map { |array| array.reduce(cell, :*) } + [best]
    best = best.max
  end
end

puts best
# 70600674



##########################################################################


def best_path(grid, x, y)
  limit = grid.length - 3
  y_valid = y < limit
  x_valid = x < limit
  cell = grid[y][x]
  paths = []
  paths << grid[y][x + 1..x + 3] if x_valid
  paths << grid[y + 1..y + 3].map { |row| row[x] } if y_valid
  paths << [grid[y + 1][x + 1], grid[y + 2][x + 2], grid[y + 3][x + 3]] if x_valid && y_valid
  paths << [grid[y + 1][x - 1], grid[y + 2][x - 2], grid[y + 3][x - 3]] if x > 3 && y_valid
  paths.map { |array| array.reduce(cell, :*) }.max || 0
end


best = 0

grid.each_with_index do |row, y|
  row.each_index do |x|
    best = [best, best_path(grid, x, y)].max
  end
end

puts best
# 70600674



##########################################################################


def best_path(grid, x, y)
  limit = grid.length - 3
  y_valid = y < limit
  x_valid = x < limit
  down = grid[y..y + 3]
  paths = []
  paths << grid[y][x..x + 3] if x_valid
  paths << down.transpose[x] if y_valid
  paths << [down[0][x], down[1][x + 1], down[2][x + 2], down[3][x + 3]] if x_valid && y_valid
  paths << [down[0][x], down[1][x - 1], down[2][x - 2], down[3][x - 3]] if x > 3 && y_valid
  paths.map { |path| path.reduce(:*) }.max || 0
end

best = 0

grid.each_with_index do |row, y|
  row.each_index do |x|
    best = [best, best_path(grid, x, y)].max
  end
end

puts best
# 70600674

##########################################################################

def best_path(grid, x, y)
  limit = grid.length - 3
  down = grid[y..y + 3]
  paths = []
  paths << grid[y][x..x + 3]
  paths << down.transpose[x]
  paths << (0..3).map { |i| down[i][x + i] } if x < limit && y < limit
  paths << (0..3).map { |i| down[i][x - i] } if x > 3 && y < limit
  paths.map { |path| path.reduce(:*) }.max || 0
end

best = 0

grid.each_with_index do |row, y|
  row.each_index do |x|
    best = [best, best_path(grid, x, y)].max
  end
end

puts best
# 70600674



#############################################################################




