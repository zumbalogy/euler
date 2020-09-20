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
  copy = "#{input}"
  copy.sub!(/\((x*)\)/, 'x\1x') while copy.match?(/\(x*\)/)
  copy.scan(/x+/).map(&:length).max || 0
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
  '(())' => 4,
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
