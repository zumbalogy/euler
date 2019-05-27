# Su Doku (Japanese meaning number place) is the name given to a popular puzzle concept.
# Its origin is unclear but credit must be attributed to Leonhard Euler who invented a similar,
# more difficult, puzzle called Latin Squares.
#
# The objective of Su Doku puzzles, is to replace the blanks (or zeros) in a 9 by 9 grid in such that
# each row, column, and 3 by 3 box contains each of the digits 1 to 9.
#
# A well constructed Su Doku puzzle has a unique solution and can be solved by logic,
# although it may be necessary to employ "guess and test" methods in order to eliminate options.
#
# The file sudoku.txt contains 50 Su Doku puzzles ranging in difficulty.
#
# Solve all 50 puzzles and find the sum of the 3-digit numbers found in the top left corner of each solution.

class Cell
  attr_accessor :solution
  attr_accessor :position
  attr_accessor :is_not
  attr_accessor :puzzle

  def initialize(value)
    @is_not = []
    unless value == 0
      @solution = value
      @is_not = [1,2,3,4,5,6,7,8,9]
    end
  end

  def col_rest
    all = @puzzle.cells.select { |x| x.position[0] == @position[0] }
    all - [self]
  end

  def row_rest
    all = @puzzle.cells.select { |x| x.position[1] == @position[1] }
    all - [self]
  end

  def grid_rest
    all = @puzzle.cells.select { |x| x.position[2] == @position[2] }
    all - [self]
  end

  def calc
    return if @solution
    peers = grid_rest | col_rest | row_rest
    @is_not = peers.map(&:solution).compact
    @is_not.uniq!

    return -1 if @is_not.length == 9
    is_maybe = [1,2,3,4,5,6,7,8,9] - @is_not

    if is_maybe.length == 1
      @solution = is_maybe.first
      @is_not = [1,2,3,4,5,6,7,8,9]
      return
    end

    [col_rest, row_rest, grid_rest].each do |rest|
      has_to_be = is_maybe
      rest.each { |x| has_to_be &= x.is_not }
      return -1 if has_to_be.length > 1
      if has_to_be.length == 1
        @solution = has_to_be.first
        @is_not = [1,2,3,4,5,6,7,8,9]
        return
      end
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
      cell.position = [col, row, grid]
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
      return -1 if res == -1
    end
  end

  def repeat_calc
    tally = solved_count()
    res = single_calc()
    return -1 if res == -1
    until tally == solved_count()
      tally = solved_count()
      res = single_calc()
      return -1 if res == -1
    end
  end

  def guess(cell_index = 0)
    res = repeat_calc()
    return if res == -1
    return if solved_count() == 81
    saved = self.cells.map(&:clone)
    cell = @cells.select { |x| x.solution == nil }[cell_index]
    return unless cell
    guesses = [1,2,3,4,5,6,7,8,9] - cell.is_not
    guesses.each do |number_guess|
      cell.solution = number_guess
      cell.is_not = [1,2,3,4,5,6,7,8,9]
      guess(cell_index + 1)
      return if solved_count() == 81
      @cells = saved
    end
  end
end

text = File.read('sudoku.txt')
digits = text.gsub(/^\D.*$/, '').scan(/./).map(&:to_i)

puzzles = digits.each_slice(81).map { |x| Puzzle.new(x) }

puzzles.each(&:guess)

firsts = puzzles.map { |x| x.cells.take(3).map(&:solution) }
int_vals = firsts.map { |x| x.join().to_i }
puts int_vals.reduce(:+)
# 24702
