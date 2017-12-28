# https://leetcode.com/problems/word-ladder-ii/description/

# Given two words (beginWord and endWord), and a dictionary's word list,
# find all shortest transformation sequence(s) from beginWord to endWord, such that:

# Only one letter can be changed at a time
# Each transformed word must exist in the word list. Note that beginWord is not a transformed word.
# For example,

# Given:
# beginWord = 'hit'
# endWord = 'cog'
# wordList = ['hot','dot','dog','lot','log','cog']

# Return
#   [
#     ['hit','hot','dot','dog','cog'],
#     ['hit','hot','lot','log','cog'],
#     ['hit', 'hot', 'dot', 'lot', 'log', 'cog'],
#     ['hit', 'hot', 'lot', 'dot', 'dog', 'cog']
#   ]

def diff_char_count(a, b)
  a.length.times.count { |i| a[i] != b[i] }
end

def build_neighbors(word, word_list)
  word_list.select { |w| diff_char_count(w, word) == 1 }
end

def build_tree(root_word, word_list, piblings = [])
  return nil unless word_list.any?
  words = word_list - [root_word]
  matches = build_neighbors(root_word, words)
  children = matches.map { |m| build_tree(m, words - piblings, matches) }
  clean_children = children.compact.reduce(&:merge)
  { root_word => clean_children }
end

class Climber
  def initialize(path, tree)
    @path = path
    @tree = tree
    self.climb
  end

  def path
    @path
  end

  def climb
    return unless @tree && @tree.keys.any?
    keys = @tree.keys
    keys.drop(1).each do |k|
      Climber.new(@path&.clone + [k], @tree[k]&.clone)
    end
    @path = @path&.clone + [keys.first]
    @tree = @tree[keys.first]&.clone
    climb
  end
end

begin_word = 'hit'
end_word = 'cog'
word_list = ['hot', 'dot', 'dog', 'lot', 'log', 'cog']

tree = build_tree(begin_word, word_list)
_climber = Climber.new([], tree)
climbers = ObjectSpace.each_object(Climber)
paths = climbers.map(&:path)
valid_paths = paths.select { |p| p.index(end_word) }
clean_paths = valid_paths.map { |p| p.slice(0, p.index(end_word) + 1) }
sorted_paths = clean_paths.sort_by(&:length)

print sorted_paths
puts()
