# Given a string containing just the characters '(' and ')',
# find the length of the longest valid (well-formed) parentheses substring.

# Example 1:
# Input: "(()"
# Output: 2
# Explanation: The longest valid parentheses substring is "()"

# Example 2:
# Input: ")()())"
# Output: 4
# Explanation: The longest valid parentheses substring is "()()"

# def valid_len(input)
#   openers = 0
#   score = 0
#   top_score = 0
#   input.each_char do |char|
#     puts "char: #{char}, score: #{score}, openers: #{openers}"
#     next openers += 1 if char == '('
#     next score = 0 if openers == 0
#     openers -= 1
#     score += 2
#     top_score = score if score > top_score
#   end
#   puts "char:  , score: #{score}, openers: #{openers}"
#   puts
#   puts
#   puts
#   top_score
# end

def pair_inner(input)
  copy = "#{input}"
  match = copy.match(/\(x*\)/)
  return copy unless match
  copy[match.begin(0)] = 'x'
  copy[match.end(0) - 1] = 'x'
  copy
end

def valid_len(input)
  prev = input
  current = pair_inner(prev)
  while prev != current
    prev = current
    current = pair_inner(current)
  end
  current.scan(/x+/).map(&:length).max || 0
end

test_pairs = {
  ')' => 0,
  '(' => 0,
  '((((' => 0,
  '(((' => 0,
  ')))))' => 0,
  '))))' => 0,
  '))))(((' => 0,
  '()' => 2,
  '(()' => 2,
  '())' => 2,
  '()()' => 4,
  '()(()' => 2,
  '(()(()' => 2,
  '(()(())' => 6,
  '(()(()))' => 8,
  ')()())' => 4,
  ')()())()()())' => 6,
  ')()()()(()))()()())' => 10
}

test_pairs.each do |test_str, expected|
  returned = valid_len(test_str)
  middle = '.'
  middle = 'X' if returned != expected

  print "got #{returned}     #{expected}      #{middle} #{test_str}"
  print "\n"
end
