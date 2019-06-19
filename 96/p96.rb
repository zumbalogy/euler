# Su Doku (Japanese for 'number place') is the name of a popular puzzle.
# Its origin is unclear but Leonhard Euler invented a similar, harder,
# puzzle called Latin Squares.
#
# The goal of Su Doku is to replace the blanks (or zeros) in a 9x9 grid in
# such that each row, column, and 3x3 box contains each of the digits 1-9.
#
# A proper Su Doku puzzle has a unique solution and is solvable by logic,
# although it may be necessary to employ "guess and test" methods.
#
# The file sudoku.txt contains 50 Su Doku puzzles ranging in difficulty.
# Find the sum of the 3-digit numbers in the top left corner of each solution.

Cells = [0b000000000] * 81

def initialize_cells(input_grid)
  input_grid.each_with_index do |int, index|
    if int == 0
      Cells[index] = 0b000000000
    else
      Cells[index] = 0b111111111 ^ (2 ** (int - 1))
    end
  end
end

def solution(is_not)
  return if is_not == 0
  is_maybe = 0b111111111 ^ is_not
  return unless (is_maybe & (is_maybe - 1)) == 0
  is_maybe
end

def col_rest(idx)
  offset = idx % 9
  indexes = [0,9,18,27,36,45,54,63,72]
  indexes.delete_at(idx / 9)
  Cells.drop(offset).values_at(*indexes)
end

def row_rest(idx)
  offset = (idx / 9) * 9
  idxs = [*offset...(offset + 9)]
  idxs.delete_at(idx - offset)
  Cells.values_at(*idxs)
end

def grid_rest(idx)
  col = idx % 9
  row = idx / 9
  grid = (3 * (row / 3)) + (col / 3)

  offset = ((grid / 3) * 27) + (grid % 3) * 3
  idxs = [0, 1, 2, 9, 10, 11, 18, 19, 20]
  idxs.delete(idx - offset)
  Cells.drop(offset).values_at(*idxs)
end

def peers_solutions(idx)
  out = 0b000000000
  (col_rest(idx) + grid_rest(idx) + row_rest(idx)).each do |cell|
    s = solution(cell)
    out |= s if s
  end
  out
end

def cell_calc(index)
  return if solution(Cells[index])
  Cells[index] = peers_solutions(index)
  return :backout if Cells[index] == 0b111111111
  is_maybe = 0b111111111 ^ Cells[index]
  return if (is_maybe & (is_maybe - 1)) == 0
  [col_rest(index), row_rest(index), grid_rest(index)].each do |rest|
    has_to_be = is_maybe
    rest.each { |x| has_to_be &= x }
    next if has_to_be == 0b000000000
    return :backout if (has_to_be & (has_to_be - 1)) != 0
    Cells[index] = 0b111111111 ^ has_to_be
    return
  end
end


def solved_count
  Cells.count { |x| solution(x) }
end

def single_calc
  81.times do |idx|
    res = cell_calc(idx)
    return :backout if res == :backout
  end
end

def repeat_calc
  tally = solved_count()
  res = single_calc()
  return :backout if res == :backout
  until tally == solved_count()
    tally = solved_count()
    res = single_calc()
    return :backout if res == :backout
  end
end

def solve(cell_index = 0)
  res = repeat_calc()
  return if res == :backout
  return if solved_count() == 81
  saved = Cells.clone()
  cell = Cells[cell_index]
  all_guesses = [
    0b000000001,
    0b000000010,
    0b000000100,
    0b000001000,
    0b000010000,
    0b000100000,
    0b001000000,
    0b010000000,
    0b100000000,
  ]
  guesses = all_guesses.select { |g| g & cell == 0b000000000 }
  guesses.each do |number_guess|
    Cells[cell_index] = 0b111111111 ^ number_guess
    solve(cell_index + 1)
    return if solved_count() == 81
    saved.each_with_index { |c, i| Cells[i] = c }
  end
end

cell_key = {
  0b100000000 => 9,
  0b010000000 => 8,
  0b001000000 => 7,
  0b000100000 => 6,
  0b000010000 => 5,
  0b000001000 => 4,
  0b000000100 => 3,
  0b000000010 => 2,
  0b000000001 => 1
}

euler_output = 0

text = File.read('sudoku.txt')
digits = text.gsub(/^\D.*$/, '').scan(/./).map(&:to_i)
puzzles_chunks = digits.each_slice(81)

puzzles_chunks.each do |chunk|
  initialize_cells(chunk)
  solve()
  corner = Cells.take(3).map { |x| cell_key[solution(x)] }
  euler_output += corner.join.to_i
end

puts euler_output
# 24702

############################################################################

# http://www.sudokusnake.com/history.php

# ai_etena = '100007090030020008009600500005300900010080002600004000300000010040000007007000300'.split('').map(&:to_i)
# initialize_cells(ai_etena)
# solve()
# print Cells.map { |x| cell_key[solution(x)] }
# 162857493534129678789643521475312986913586742628794135356478219241935867897261354

# easter_monster = '100000002090400050006000700050903000000070000000850040700000600030009080002000001'.split('').map(&:to_i)
# initialize_cells(easter_monster)
# solve()
# print Cells.map { |x| cell_key[solution(x)] }
# 174385962293467158586192734451923876928674315367851249719548623635219487842736591

# golden_nugget = '000000039000010005003005800008009006070020000100400000009008050020000600400700000'.split('').map(&:to_i)
# initialize_cells(golden_nugget)
# solve()
# print Cells.map { |x| cell_key[solution(x)] }
# 751864239892317465643295871238179546974526318165483927319648752527931684486752193

# foo = '000000039000010005003005800008009006070020000100400000009008050020000600400700000'.split('').map(&:to_i)
# initialize_cells(foo)
# solve()
# print Cells.map { |x| cell_key[solution(x)] }
# # 751864239892317465643295871238179546974526318165483927319648752527931684486752193

# https://norvig.com/sudoku.html

# norvig_top_95 = File.read('norvig_hard95.txt').gsub('.', '0').scan(/./).map(&:to_i)
# puzzles_chunks = norvig_top_95.each_slice(81)
#
# timer = Time.now.to_f
# times = []
# puzzles_chunks.each do |chunk|
#   initialize_cells(chunk)
#   solve()
#   a = Time.now.to_f
#   times.push(a - timer)
#   puts a - timer
#   timer = a
# end
# puts
# puts times.reduce(:+) / times.length
