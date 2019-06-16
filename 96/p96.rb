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

def solutionX(is_not)
  return if is_not == 0
  is_maybe = 0b111111111 ^ is_not
  return unless (is_maybe & (is_maybe - 1)) == 0
  is_maybe
end

Cells = [0b000000000] * 81

class Puzzle

  def initialize(input_grid)
    input_grid.each_with_index do |int, index|
      if int == 0
        Cells[index] = 0b000000000
      else
        Cells[index] = 0b111111111 ^ (2 ** (int - 1))
      end
    end
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
    idxs.delete_at(idx - offset)
    Cells.drop(offset).values_at(*idxs)
  end

  def peers_solutions(idx)
    out = 0b000000000
    (col_rest(idx) + grid_rest(idx) + row_rest(idx)).each do |cell|
      s = solutionX(cell)
      out |= s if s
    end
    out
  end

  def cell_calc(cell, index) # TODO: dont need this cell
    return if solutionX(Cells[index])
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
    Cells.count { |x| solutionX(x) }
  end

  def single_calc
    Cells.each_with_index do |cell, idx|
      res = cell_calc(cell, idx)
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
    saved = Cells.map(&:clone) # TODO: this can be better now
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
    guesses = all_guesses.select { |g| g & cell == 0 }
    guesses.each do |number_guess|
      Cells[cell_index] = 0b111111111 ^ number_guess
      solve(cell_index + 1)
      return if solved_count() == 81 # is this needed
      saved.each_with_index { |c, i| Cells[i] = c }
    end
  end
end

text = File.read('sudoku.txt')
digits = text.gsub(/^\D.*$/, '').scan(/./).map(&:to_i)

puzzles_chunks = digits.each_slice(81)

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

puzzles_chunks.each do |chunk|
  puzzle = Puzzle.new(chunk)
  puzzle.solve()
  foo = Cells.take(3).map { |x| cell_key[solutionX(x)] }.join.to_i
  euler_output += foo
end

puts euler_output
# 24702



# AI Etena
# 100 007 090
# 030 020 008
# 009 600 500

# 005 300 900
# 010 080 002
# 600 004 000

# 300 000 010
# 040 000 007
# 007 000 300

# real    0m30.747s

# ai_etena = '100007090030020008009600500005300900010080002600004000300000010040000007007000300'.split('').map(&:to_i)
# ai_etena = '100007090030020008009600500005300900010080002600004000300000010040000007007000300'.split('').map(&:to_i)
# 162857493534129678789643521475312986913586742628794135356478219241935867897261354



# real    3m31.468s
# easter_monster = %w(
#   100 000 089
#   000 009 002
#   000 000 450
#
#   007 600 000
#   030 040 000
#   900 002 005
#
#   004 070 000
#   500 008 010
#   060 300 000
# ).join().split('').map(&:to_i)
#
# p = Puzzle.new(ai_etena)
#
# p.solve()
#
# solution = p.cells.map(&:solution).map { |x| Math.log2(x).to_i + 1 }.join('')
#
# puts solution
# if solution == '162857493534129678789643521475312986913586742628794135356478219241935867897261354'
#   puts "correct"
# else
#   puts "wrong"
# end
