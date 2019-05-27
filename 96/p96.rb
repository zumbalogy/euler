# Su Doku (Japanese meaning number place) is the name given to a popular puzzle concept.
# Its origin is unclear but credit must be attributed to Leonhard Euler who invented a similar, more difficult, puzzle called Latin Squares.
#
# The objective of Su Doku puzzles, is to replace the blanks (or zeros) in a 9 by 9 grid in such that each row, column, and 3 by 3 box
# contains each of the digits 1 to 9.
#
# A well constructed Su Doku puzzle has a unique solution and can be solved by logic, although it may be necessary to employ
# "guess and test" methods in order to eliminate options (there is much contested opinion over this).
#
# The file sudoku.txt contains fifty different Su Doku puzzles ranging in difficulty, all with unique solutions.
#
# Solve all 50 puzzles and find the sum of the 3-digit numbers found in the top left corner of each solution grid.

require 'pry'

$counter = 0

text = File.read('sudoku.txt')
chopped = text.split(/Grid.*\n/).drop(1)
grids = chopped.map { |foo| foo.split("\n").map { |x| x.split('').map(&:to_i) } }

class Cell
  attr_accessor :solution
  attr_accessor :position
  attr_accessor :is_not
  attr_accessor :puzzle

  def initialize(value)
    @is_not = []
    unless value == 0
      @solution = value
      @is_not = [1,2,3,4,5,6,7,8,9] - [value]
    end
  end

  def col_rest
    all = @puzzle.cells.select { |x| x.position[0] == @position[0] }
    all - [self]
  end

  def row_rest
    all = @puzzle.cells.select { |x| x.position[1] ==  @position[1] }
    all - [self]
  end

  def grid_rest
    all = @puzzle.cells.select { |x| x.position[2] == @position[2] }
    all - [self]
  end

  def calc
    return if @solution
    peers = grid_rest | col_rest | row_rest
    other_solutions = peers.map(&:solution).compact
    @is_not = other_solutions
    @is_not.uniq! if other_solutions.any?
    if @is_not.length == 8
      @solution = ([1,2,3,4,5,6,7,8,9] - @is_not).first
      return
    end

    [col_rest, row_rest, grid_rest].each do |rest|
      cant = rest.reduce((1..9).to_a - @is_not) { |a, b| a & (b.is_not + [b.solution].compact) }
      if cant.length == 1
        @solution = cant.first
        @is_not = [1,2,3,4,5,6,7,8,9] - cant
        return
      # elsif cant.length > 1
      # TODO: propigate an error or such that will short circuit the guessing
      #   return
      end
    end
  end
end

class Puzzle
  attr_accessor :cells

  def initialize(input_grid)
    @cells = []
    input_grid.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        cell = Cell.new(col)
        grid_index = (col_index / 3)
        grid_index += 3 if row_index > 2
        grid_index += 3 if row_index > 5
        cell.position = [col_index, row_index, grid_index]
        cell.puzzle = self
        @cells.push(cell)
      end
    end
  end

  def repeat_calc
    tally = solved_count()
    calc()
    until tally == solved_count()
      tally = solved_count()
      calc()
    end
  end

  def calc
    @cells.each(&:calc)
  end

  def guess(cell_index = 0)
    saved = self.cells.map(&:clone)
    cell = @cells.select { |x| x.solution == nil }[cell_index]
    return unless cell

    guesses = (1..9).to_a - cell.is_not
    guesses.each do |number_guess|
      $counter += 1
      cell.solution = number_guess
      cell.is_not = (1..9).to_a - [number_guess]
      repeat_calc()
      return if solved_count == 81
      guess(cell_index + 1)
      return if solved_count == 81
      @cells = saved
    end
  end

  def solved_count
    @cells.select(&:solution).compact.count
  end

  def show_off(timer = 0)
    puts
    rows = @cells.map { |x| x.solution ? x.solution : '_' }.each_slice(9)
    rows.each_with_index { |x, index|
      puts '______________________' if index == 3 || index == 6
      x[2..2] = [x[2], '|']
      x[6..6] = [x[6], '|']
      puts x.join(' ')
    }
    puts
    puts "solution length #{ solved_count }"
    puts
  end
end


puzzles = grids.map { |x| Puzzle.new(x) }

puzzles.each do |puzzle|
  $counter = 0
  time1 = Time.now
  puzzle.repeat_calc()
  puzzle.guess() if puzzle.solved_count < 81
  # puzzle.show_off()
  puts Time.now - time1
  puts $counter
end

firsts = puzzles.map { |x| x.cells.take(3).map(&:solution) }
int_vals = firsts.map { |x| x.join().to_i }
puts int_vals.reduce(:+)
puts "this should be 24702: #{int_vals.reduce(:+) == 24702}"
# 24702

# string_AI_Etena = %w(
#   100 007 090
#   030 020 008
#   009 600 500
#
#   005 300 900
#   010 080 002
#   600 004 000
#
#   300 000 010
#   040 000 007
#   007 000 300
# )

# foo = %w(
#   100 007 090
#   030 020 008
#   009 600 500
#
#   005 300 900
#   010 080 002
#   600 004 000
#
#   300 000 010
#   040 000 007
#   007 000 300
# )

# # Easter Monster
# foo = %w(
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
# )

# grid = foo.join().split('').map(&:to_i).each_slice(9).to_a
#
# grid = grids[49]
#
# puzzle = Puzzle.new(grid)
#
# puzzle.repeat_calc()
# puzzle.guess()
#
# puts
#
# puzzle.show_off()
#
# puts "checked #{$counter} times"


# AI Etena solution
# 162 857 493
# 534 129 678
# 789 643 521
#
# 475 312 986
# 913 586 742
# 628 794 135
#
# 356 478 219
# 241 935 867
# 897 261 354
