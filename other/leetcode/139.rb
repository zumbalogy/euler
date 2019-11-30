# Given a non-empty string s and a dictionary wordDict containing a list of
# non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.

# Note:
# The same word in the dictionary may be reused multiple times in the segmentation.
# You may assume the dictionary does not contain duplicate words.

# Example 1:
# Input: s = "leetcode", wordDict = ["leet", "code"]
# Output: true
# Explanation: Return true because "leetcode" can be segmented as "leet code".

# Example 2:
# Input: s = "applepenapple", wordDict = ["apple", "pen"]
# Output: true
# Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".

# Example 3:
# Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
# Output: false

def check(input, dict)
  indexes = []
  dict.each do |word|
    return true if word == input
    indexes.push(word.length) if input.start_with?(word)
  end
  indexes.any? { |i| check(input[i..], dict) }
end

puts check('leetcode', ['leet', 'code'])
puts check('applepenapple', ['apple', 'pen'])
puts check('catsandog', ['cats', 'dog', 'sand', 'and', 'cat'])
