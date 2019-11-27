# You are given an n x n 2D matrix representing an image.
# Rotate the image by 90 degrees (clockwise).

# Note:
# You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

# Example 1:
# Given input matrix = [
#   [1,2,3],
#   [4,5,6],
#   [7,8,9]
# ]
# rotate the input matrix in-place such that it becomes:
# [
#   [7,4,1],
#   [8,5,2],
#   [9,6,3]
# ]

# Example 2:
# Given input matrix =
# [
#   [ 5, 1, 9,11],
#   [ 2, 4, 8,10],
#   [13, 3, 6, 7],
#   [15,14,12,16]
# ]
# rotate the input matrix in-place such that it becomes:
# [
#   [15,13, 2, 5],
#   [14, 3, 4, 1],
#   [12, 6, 8, 9],
#   [16, 7,10,11]
# ]


def rotate_ring(input, n, offset)
  y = offset
  x = offset
  (n - 1).times do |_|
    save = input[y][x]
    (n - 1).times do
      x += 1
      old_save = save
      save = input[y][x]
      input[y][x] = old_save
    end
    (n - 1).times do
      y += 1
      old_save = save
      save = input[y][x]
      input[y][x] = old_save
    end
    (n - 1).times do
      x -= 1
      old_save = save
      save = input[y][x]
      input[y][x] = old_save
    end
    (n - 1).times do
      y -= 1
      old_save = save
      save = input[y][x]
      input[y][x] = old_save
    end
  end
end

def rotate_grid(input)
  n = input.length
  i = 0
  while n > 1
    rotate_ring(input, n, i)
    n -= 2
    i += 1
  end
end

foo = [
  [ 1, 2, 3, 4, 5],
  [16, 1, 2, 3, 6],
  [15, 8, 0, 4, 7],
  [14, 7, 6, 5, 8],
  [13,12,11,10, 9],
]
# foo = [
#   [2, 3,],
#   [0, 4,],
# ]

rotate_grid(foo)

puts foo.to_s.split('],')
