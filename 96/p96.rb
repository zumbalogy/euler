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

class Cell
  attr_accessor :solution
  attr_accessor :pos
  attr_accessor :is_not
  attr_accessor :puzzle
  attr_accessor :grid_indexes

  def initialize(value, puzzle)
    @puzzle = puzzle
    @is_not = 0b000000000
    return if value == 0
    @solution = (2 ** (value - 1))
    @is_not = 0b111111111
  end

  def col_rest
    offset = @pos[0]
    indexes = [0,9,18,27,36,45,54,63,72]
    indexes.delete_at(@pos[1])
    @puzzle.cells.drop(offset).values_at(*indexes)
  end

  def row_rest
    offset = @pos[1] * 9
    rest = @puzzle.cells[offset...(offset + 9)]
    rest - [self]
  end

  def grid_rest
    # TODO: make this better
    @grid_indexes = @grid_indexes || 81.times.find_all { |i|  @puzzle.cells[i].pos[2] == @pos[2] }
    rest = @puzzle.cells.values_at(*@grid_indexes)
    rest - [self]
  end

  def peers_solutions
    out = 0b000000000
    (col_rest + grid_rest + row_rest).each do |cell|
      out |= cell.solution if cell.solution
    end
    out
  end

  def calc
    return if @solution
    @is_not = peers_solutions()
    return :backout if @is_not == 0b111111111
    is_maybe = 0b111111111 ^ @is_not
    if (is_maybe & (is_maybe - 1)) == 0
      @solution = is_maybe
      return
    end
    [col_rest(), row_rest(), grid_rest()].each do |rest|
      has_to_be = is_maybe
      rest.each { |x| has_to_be &= x.is_not }
      next if has_to_be == 0b000000000
      return :backout if (has_to_be & (has_to_be - 1)) != 0
      @solution = has_to_be
      @is_not = 0b111111111
      return
    end
  end
end

class Puzzle
  attr_accessor :cells

  def initialize(input_grid)
    @cells = []
    input_grid.each_with_index do |int, index|
      cell = Cell.new(int, self)
      col = index % 9
      row = index / 9
      grid = (3 * (row / 3)) + (col / 3)
      cell.pos = [col, row, grid]
      @cells.push(cell)
    end
  end

  def solved_count
    @cells.select(&:solution).compact.count
  end

  def single_calc
    @cells.each do |cell|
      res = cell.calc()
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
    saved = self.cells.map(&:clone)
    cell = @cells.reject(&:solution)[cell_index]
    return unless cell
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
    guesses = all_guesses.select { |g| g & cell.is_not == 0 }
    guesses.each do |number_guess|
      cell.solution = number_guess
      cell.is_not = 0b111111111
      solve(cell_index + 1)
      return if solved_count() == 81
      @cells = saved
    end
  end
end

# text = File.read('sudoku.txt')
# digits = text.gsub(/^\D.*$/, '').scan(/./).map(&:to_i)
#
# puzzles = digits.each_slice(81).map { |x| Puzzle.new(x) }
# puzzles.each(&:solve)
#
#
# solution_key = {
#   0b100000000 => 9,
#   0b010000000 => 8,
#   0b001000000 => 7,
#   0b000100000 => 6,
#   0b000010000 => 5,
#   0b000001000 => 4,
#   0b000000100 => 3,
#   0b000000010 => 2,
#   0b000000001 => 1
# }
#
# solutions = puzzles.map { |p| p.cells.map { |x| solution_key[x.solution] } }
# top_3s = solutions.map { |x| x.take(3).join.to_i }
# puts top_3s.reduce(:+)
# # 24702



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

# real    1m54.779s

# ai_etena = '100007090030020008009600500005300900010080002600004000300000010040000007007000300'.split('').map(&:to_i)
ai_etena = '100007090030020008009600500005300900010080002600004000300000010040000007007000300'.split('').map(&:to_i)
# 162857493534129678789643521475312986913586742628794135356478219241935867897261354

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
p = Puzzle.new(ai_etena)

p.solve()

solution = p.cells.map(&:solution).map { |x| Math.log2(x).to_i + 1 }.join('')

puts solution
if solution == '162857493534129678789643521475312986913586742628794135356478219241935867897261354'
  puts "correct"
else
  puts "wrong"
end


#
# # p = Puzzle.new(easter_monster)
