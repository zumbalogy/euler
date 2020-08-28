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
$score = 0

def init_cells(input_grid)
  input_grid.each_with_index do |int, index|
    if int == 0
      Cells[index] = 0b000000000
    else
      Cells[index] = 0b111111111 ^ (2 ** (int - 1))
    end
  end
end

def solution(is_not)
  # return if is_not == 0
  return unless (is_not | (is_not + 1)) == 0b111111111
  return 0b111111111 ^ is_not
end

def col_rest(idx)
  offset = idx % 9
  indexes = [0, 9, 18, 27, 36, 45, 54, 63, 72]
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

def peers_solutions(peers)
  out = 0b000000000
  peers.each do |cell|
    next unless (cell | (cell + 1)) == 0b111111111
    out |= 0b111111111 ^ cell
  end
  out
end

def cell_calc(index)
  if solution(Cells[index])
    $score += 1
    return
  end
  c_rest = col_rest(index)
  g_rest = grid_rest(index)
  r_rest = row_rest(index)
  Cells[index] = peers_solutions(c_rest + g_rest + r_rest)
  return :backout if Cells[index] == 0b111111111
  is_maybe = 0b111111111 ^ Cells[index]
  if (is_maybe & (is_maybe - 1)) == 0
    $score += 1
    return
  end
  [c_rest, g_rest, r_rest].each do |rest|
    has_to_be = is_maybe
    rest.each { |x| has_to_be &= x }
    next if has_to_be == 0b000000000
    return :backout if (has_to_be & (has_to_be - 1)) != 0
    Cells[index] = 0b111111111 ^ has_to_be
    $score += 1
    return
  end
end

def single_calc
  $score = 0
  81.times do |idx|
    res = cell_calc(idx)
    return :backout if res == :backout
  end
end

def repeat_calc
  tally = $score
  res = single_calc()
  return :backout if res == :backout
  until tally == $score
    tally = $score
    res = single_calc()
    return :backout if res == :backout
  end
end

def solve(cell_index = 0)
  res = repeat_calc()
  return if res == :backout
  return if $score == 81
  saved_cells = Cells.clone()
  saved_score = $score
  cell = Cells[cell_index]
  guesses = [
    0b111111110,
    0b111111101,
    0b111111011,
    0b111110111,
    0b111101111,
    0b111011111,
    0b110111111,
    0b101111111,
    0b011111111
  ]
  guesses.each do |number_guess|
    next unless (number_guess & cell) == cell
    Cells[cell_index] = number_guess
    solve(cell_index + 1)
    return if $score == 81
    saved_cells.each_with_index { |c, i| Cells[i] = c }
    $score = saved_score
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

text = File.read(__dir__ + '/sudoku.txt')
digits = text.gsub(/^\D.*$/, '').scan(/./).map(&:to_i)
puzzles_chunks = digits.each_slice(81)

puzzles_chunks.each do |chunk|
  init_cells(chunk)
  solve()
  corner = Cells.take(3).map { |x| cell_key[solution(x)] }
  euler_output += corner.join.to_i
end

puts euler_output
# 24702
