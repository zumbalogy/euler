# Given an integer n, find the closest integer (not including itself), which is a palindrome.
# The 'closest' is defined as absolute difference minimized between two integers.

# Example:
# Input: 123
# Output: 121

# If there is a tie, return the smaller one as answer.

def make_pal(num, len)
  return num + num.reverse if num.length * 2 == len
  num + num.reverse[1..-1]
end

def next_pal(front, len, direction)
  num = front + direction
  return num if len == 1 && num < 10
  make_pal(num.to_s, len).to_i
end

def closest_pal(n)
  nums = n.to_s.split('').map(&:to_i)
  front_size = (nums.count / 2.0).round
  front = nums.take(front_size).join('').to_i
  pals = [
    ('9' * (nums.count - 1)).to_i,
    next_pal(front, nums.count, -1),
    next_pal(front, nums.count, 0),
    next_pal(front, nums.count, 1),
  ]
  clean_pals = pals.select { |x| x != n }
  clean_pals.sort.min_by { |x| (x - n).abs }
end

throw('') unless closest_pal(123) == 121
throw('') unless closest_pal(120) == 121
throw('') unless closest_pal(129) == 131
throw('') unless closest_pal(55) == 44
throw('') unless closest_pal(98) == 99
throw('') unless closest_pal(90) == 88
throw('') unless closest_pal(199) == 202
throw('') unless closest_pal(1) == 0
throw('') unless closest_pal(2) == 1
throw('') unless closest_pal(9) == 8
throw('') unless closest_pal(10) == 9
throw('') unless closest_pal(100) == 99
throw('') unless closest_pal(101) == 99
throw('') unless closest_pal(99) == 101
throw('') unless closest_pal(121) == 111
