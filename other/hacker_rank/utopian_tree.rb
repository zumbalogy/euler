=begin

The Utopian tree goes through 2 cycles every year. The first cycle of the tree is monsoon season when it doubles height. The 2nd cycle is summer when it grows height by 1 meter.

If a new Utopian tree sapling of height 1 meter is planted just before the onset of the monsoon season, find the height of a tree after N cycles.

Input Format
The first line of the input contains an integer T, the number of testcases.
T lines follow each line containing the integer N, indicating the number of cycles.

Constraints
1 <= T <= 10
0 <= N <= 60

Output Format
Print the height of the Utopian tree after N cycles.

=end

def tree_h cycles
  output = 1
  (1..cycles).each do |v|
    v.odd? ? output *= 2 : output += 1
  end
  output
end

def tree_2 cycles, height = 1
  if cycles == 0
    height
  elsif cycles.odd?
    tree_2(cycles - 1, height * 2)
  else
    tree_2(cycles - 1, height + 1)
  end
end

def tree_3 cycles, height = 1
  (cycles.zero? && height) ||
  (cycles.odd? && tree_3(cycles - 1, height * 2)) ||
  tree_3(cycles - 1, height + 1)
end

p tree_h 5
# => 14

p tree_2 5
# => 14

p tree_3 5
# => 14
