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

  def initialize(value)
    @is_not = []
    return if value == 0
    @solution = value
    @is_not = [1,2,3,4,5,6,7,8,9]
  end

  def col_rest
    rest = @puzzle.cells.select { |x| x.pos[0] == @pos[0] }
    rest - [self]
  end

  def row_rest
    rest = @puzzle.cells.select { |x| x.pos[1] == @pos[1] }
    rest - [self]
  end

  def grid_rest
    rest = @puzzle.cells.select { |x| x.pos[2] == @pos[2] }
    rest - [self]
  end

  def peers_solutions
    out = []
    @puzzle.cells.each do |cell|
      hit = cell.solution && (cell.pos[0] == @pos[0] ||
                              cell.pos[1] == @pos[1] ||
                              cell.pos[2] == @pos[2])
      out.push(cell.solution) if hit
    end
    out.uniq!
    out
  end

  def calc
    return if @solution
    @is_not = peers_solutions()

    return :backout if @is_not.length == 9
    is_maybe = [1,2,3,4,5,6,7,8,9] - @is_not

    if is_maybe.length == 1
      @solution = is_maybe.first
      @is_not = [1,2,3,4,5,6,7,8,9]
      return
    end
    [col_rest(), row_rest(), grid_rest()].each do |rest|
      has_to_be = is_maybe
      rest.each { |x| has_to_be &= x.is_not }
      next if has_to_be.length == 0
      return :backout if has_to_be.length > 1
      @solution = has_to_be.first
      @is_not = [1,2,3,4,5,6,7,8,9]
      return
    end
  end
end

class Puzzle
  attr_accessor :cells

  def initialize(input_grid)
    @cells = []
    input_grid.each_with_index do |int, index|
      cell = Cell.new(int)
      col = index % 9
      row = index / 9
      grid = (3 * (row / 3)) + (col / 3)
      cell.pos = [col, row, grid]
      cell.puzzle = self
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
    guesses = [1,2,3,4,5,6,7,8,9] - cell.is_not
    guesses.each do |number_guess|
      cell.solution = number_guess
      cell.is_not = [1,2,3,4,5,6,7,8,9]
      solve(cell_index + 1)
      return if solved_count() == 81
      @cells = saved
    end
  end
end

text = File.read('sudoku.txt')
digits = text.gsub(/^\D.*$/, '').scan(/./).map(&:to_i)

puzzles = digits.each_slice(81).map { |x| Puzzle.new(x) }
puzzles.each(&:solve)

solutions = puzzles.map { |p| p.cells.map(&:solution) }
top_3s = solutions.map { |x| x.take(3).join.to_i }
puts top_3s.reduce(:+)
# 24702


# AI Etena
# 100007090030020008009600500005300900010080002600004000300000010040000007007000300
# real    1m54.779s

# ai_etena = '100007090030020008009600500005300900010080002600004000300000010040000007007000354'.split('').map(&:to_i)
#
# p = Puzzle.new(ai_etena)
#
# p.solve()
#
# puts p.cells.map(&:solution).join('')
# if p.cells.map(&:solution).join('') == '162857493534129678789643521475312986913586742628794135356478219241935867897261354'
#   puts "correct"
# else
#   puts "wrong"
# end

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
# # p = Puzzle.new(easter_monster)
