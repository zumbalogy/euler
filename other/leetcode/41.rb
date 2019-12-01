# Given an unsorted integer array, find the smallest missing positive integer.

# Example 1:
# Input: [1,2,0]
# Output: 3

# Example 2:
# Input: [3,4,-1,1]
# Output: 2

# Example 3:
# Input: [7,8,9,11,12]
# Output: 1

# Note:
# Your algorithm should run in O(n) time and uses constant extra space.

def low_missing(input)
  i = 0
  while i < input.length
    item = input[i]
    next i += 1 if input[item] == input[i]
    next i += 1 if item < 0 || item > input.length - 1
    input[i], input[item] = input[item], input[i]
  end
  out = 1
  out += 1 while out == input[out]
  out
end

puts low_missing([1, 2, 0])
puts low_missing([1, 2, 0, 1])
puts low_missing([3, 4, -1, 1])
puts low_missing([7, 8, 9, 11, 12])
