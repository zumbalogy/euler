# Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent,
# with the colors in the order red, white and blue.
# Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
# Note: You are not suppose to use the library's sort function for this problem.

# Example:
# Input: [2,0,2,1,1,0]
# Output: [0,0,1,1,2,2]

def sort_color!(input)
  i_0 = 0
  i_2 = input.length - 1
  i = 0
  while i < i_2
    item = input[i]
    if item == 0
      input[i] = input[i_0]
      input[i_0] = 0
      i_0 += 1
    elsif item == 2
      input[i] = input[i_2]
      input[i_2] = 2
      i_2 -= 1
    end
    i += 1 unless item == 2
  end
  input
end

puts sort_color!([2,0,2,1,1,0])
# puts sort_color!([2,0,2,1,1,0,1])
# puts sort_color!([2,0,2,1,1,0,1,2,2,2,1,1,2,1,1,1,2,2,2,2,1,1,2,0,0,0,2,1,2,2,1,0])
