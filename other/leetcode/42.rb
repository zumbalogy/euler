# Given n non-negative integers representing an elevation map where the width of
# each bar is 1, compute how much water it is able to trap after raining.

# The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1].
# In this case, 6 units of rain water are being trapped.

# Example:
# Input: [0,1,0,2,1,0,1,3,2,1,2,1]
# Output: 6


def rain(input)
  i = 1
  tally = 0
  while i < input.length - 1
    item = input[i]
    left = input.slice(0, i).max
    right = input[(i + 1)..].max
    cutoff = [left, right].min
    diff = cutoff - item
    tally += diff if diff > 0
    i += 1
  end
  tally
end

puts rain([0,1,0,2,1,0,1,3,2,1,2,1])
