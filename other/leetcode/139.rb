# Given a non-empty string s and a dictionary wordDict containing a list of
# non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.

# Note:
# The same word in the dictionary may be reused multiple times in the segmentation.
# You may assume the dictionary does not contain duplicate words.

# Example 1:
# Input: s = 'leetcode', wordDict = ['leet', 'code']
# Output: true
# Explanation: Return true because 'leetcode' can be segmented as 'leet code'.

# Example 2:
# Input: s = 'applepenapple', wordDict = ['apple', 'pen']
# Output: true
# Explanation: Return true because 'applepenapple' can be segmented as 'apple pen apple'.

# Example 3:
# Input: s = 'catsandog', wordDict = ['cats', 'dog', 'sand', 'and', 'cat']
# Output: false

def check(input, dict)
  dict.each do |word|
    return true if word == input
    next unless input.start_with?(word)
    return true if check(input[word.length..], dict)
  end
  false
end

puts check('leetcode', ['leet', 'code'])
puts check('applepenapple', ['apple', 'pen'])
puts check('catsandog', ['cats', 'dog', 'sand', 'and', 'cat'])

# For extreme inputs, it might be worth checking to see if the
# length of the initial input string is divisible by the lengths of the
# words in the dictionary.
# It would also likely be worth memoizing the 'check' function,
# as to prune dead ends on the search tree.
