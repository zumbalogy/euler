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

def valid_len(input)
  openers = 0
  score = 0
  top_score = 0
  input.each_char do |char|
    next openers += 1 if char == '('
    next score = 0 if openers == 0
    openers -= 1
    score += 1
    top_score = score if score > top_score
  end
  top_score * 2
end

puts valid_len('(()')
puts valid_len(')()())')
puts valid_len(')()())()()())')
puts valid_len(')()()()(()))()()())')
