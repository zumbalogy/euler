=begin

Given an array of unsorted positive ints, write a function that finds runs of 3 consecutive numbers (ascending or descending) and returns the indices where such runs begin.  If no such runs are found, return null.

function findConsecutiveRuns(input:Array):Array
Example:  [1, 2, 3, 5, 10, 9, 8, 9, 10, 11, 7] would return [0, 4, 6, 7]

=end

a = [1, 2, 3, 5, 10, 9, 8, 9, 10, 11, 7]

a.each_index.select { |i|
  (a[i + 2] == a[i] + 2 && a[i + 1] == a[i] + 1) ||
  (a[i + 2] == a[i] - 2 && a[i + 1] == a[i] - 1)
}
# => [0, 4, 6, 7]
