# https://leetcode.com/problems/word-ladder-ii/description/

# Given two words (X and Y), and a word list,
# find the shortest transformation sequence(s) from X to Y, such that:
# Only 1 letter changes per step and each step is in the word list.

def grow_tree(root, nodes, adopt_fn)
  kids = nodes.select { |w| adopt_fn.call(root, w) }
  branches = kids.map { |k| grow_tree(k, nodes - [root], adopt_fn) }
  { root => branches.reduce(&:merge) }
end

def climb_tree(tree, out = [])
  return [out] unless tree&.any?
  tree.keys.map { |k| climb_tree(tree[k], out + [k]) }.flatten(1)
end

def diff_length(a, b)
  a.length.times.count { |i| a[i] != b[i] }
end

root = 'hit'
target = 'cog'
list = ['hot', 'dot', 'dog', 'lot', 'log', 'cog']

adopt_proc = proc { |a, b| 1 == diff_length(a, b) }

tree = grow_tree(root, list, adopt_proc)
paths = climb_tree(tree)

valid = paths.select { |p| p.index(target) }
sliced = valid.map { |p| p.slice(0, p.index(target) + 1) }
sorted = sliced.sort_by(&:length)
top = sorted.take_while { |p| p.length == sorted.first.length }

p(top)
# [['hit', 'hot', 'dot', 'dog', 'cog'], ['hit', 'hot', 'lot', 'log', 'cog']]

# this tree code can also be used to solve this puzzle
# climb_tree(grow_tree(8, (1..15).to_a, proc {|a,b| a != b && Math.sqrt(a+b) % 1 == 0 }))
# https://youtu.be/G1m7goLCJDY
# [8, 1, 15, 10, 6, 3, 13, 12, 4, 5, 11, 14, 2, 7, 9]

# also note that one would maybe want to memoize the adopt_fn
# or such for large trees or if the adopt_fn is expensive.
