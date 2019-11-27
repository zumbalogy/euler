# Given a m x n grid filled with non-negative numbers, find a path from top left
# to bottom right which minimizes the sum of all numbers along its path.
# Note: You can only move either down or right at any point in time.

# Input:
# [
#   [1,3,1],
#   [1,5,1],
#   [4,2,1]
# ]
# Output: 7
# Explanation: Because the path 1→3→1→1→1 minimizes the sum.

def min(input)
  input.each_with_index do |row, row_i|
    row.each_with_index do |col, col_i|
      comparisons = []
      comparisons.push(row[col_i - 1]) if col_i > 0
      comparisons.push(input[row_i - 1][col_i]) if row_i > 0
      row[col_i] += comparisons.min if comparisons.any?
    end
  end
  input.last.last
end

test_input = [
  [1,3,1],
  [1,5,1],
  [4,2,1]
]

puts min(test_input)
