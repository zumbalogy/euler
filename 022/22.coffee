# Using names.txt, a 46K text file containing over five-thousand names, begin by sorting it into alphabetical order.
# Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
# So, COLIN would obtain a score of 938 × 53 = 49714.

# What is the total of all the name scores in the file?

fs = require 'fs'

readNames = (file) ->
  fs.readFileSync(__dirname + file, 'utf8').replace(/"/g, '').split(',')

letterScore = (letter) ->
  letter.charCodeAt() - 64

wordScore = (word) ->
  word.split('').reduce ((a, b) -> a + letterScore(b)), 0

scoreAll = (words) ->
  words.reduce ((a, b, i) -> a + (wordScore(b) * (i + 1))), 0

console.log(scoreAll(readNames('/names.txt').sort()))
# 871198282
