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


text = File.read('sudoku.txt')
chopped = text.split(/Grid.*\n/).drop(1)
grids = chopped.map { |foo| foo.split("\n").map { |x| x.split('').map(&:to_i) } }

require 'pry'

# grid = [
#   [0, 0, 3, 0, 2, 0, 6, 0, 0],
#   [9, 0, 0, 3, 0, 5, 0, 0, 1],
#   [0, 0, 1, 8, 0, 6, 4, 0, 0],
#   [0, 0, 8, 1, 0, 2, 9, 0, 0],
#   [7, 0, 0, 0, 0, 0, 0, 0, 8],
#   [0, 0, 6, 7, 0, 8, 2, 0, 0],
#   [0, 0, 2, 6, 0, 9, 5, 0, 0],
#   [8, 0, 0, 2, 0, 3, 0, 0, 9],
#   [0, 0, 5, 0, 1, 0, 3, 0, 0]
# ]




#  2  _  _    _  8  _    3  _  _
#  _  6  _    _  7  _    _  8  4
#  _  3  _    5  _  _    2  _  9
#
#  _  _  _    1  _  5    4  _  8
#  _  _  _    _  _  _    _  _  _
#  4  _  2    7  _  6    _  _  _
#
#  3  _  1    _  _  7    _  4  _
#  7  2  _    _  4  _    _  6  _
#  _  _  4    _  1  _    _  _  3



# grid = [
#  [2, 0, 0,   0, 8, 0,   3, 0, 0],
#  [0, 6, 0,   0, 7, 0,   0, 8, 4],
#  [0, 3, 0,   5, 0, 0,   2, 0, 9],
#
#  [0, 0, 0,   1, 0, 5,   4, 0, 8],
#  [0, 0, 0,   0, 0, 0,   0, 0, 0],
#  [4, 0, 2,   7, 0, 6,   0, 0, 0],
#
#  [3, 0, 1,   0, 0, 7,   0, 4, 0],
#  [7, 2, 0,   0, 4, 0,   0, 6, 0],
#  [0, 0, 4,   0, 1, 0,   0, 0, 3]
# ]

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

  def to_s
    [
      "solution: #{solution}",
      "position: #{position}",
      "is_not: #{is_not}"
    ].join("\n")
  end

  def row
    @position[1]
  end

  def col
    @position[0]
  end

  def grid
    @position[2]
  end

  def row_rest
    all = @puzzle.cells.select { |x| x.row == self.row }
    all - [self]
  end

  def col_rest
    all = @puzzle.cells.select { |x| x.col == self.col }
    all - [self]
  end

  def grid_rest
    all = @puzzle.cells.select { |x| x.grid == self.grid }
    all - [self]
  end

  def calc
    return if @solution
    peers = grid_rest | col_rest | row_rest
    other_solutions = peers.map(&:solution).compact.uniq.sort
    @is_not += other_solutions
    @is_not.uniq!
    if @is_not.length == 8
      @solution = ([1,2,3,4,5,6,7,8,9] - @is_not).first
      return
    end

    ((1..9).to_a - @is_not).each do |target|
      unless grid_rest.map(&:solution).include?(target)
        if grid_rest.all? { |x| x.is_not.include?(target) }
          @solution = target
          @is_not = (1..9).to_a - [target]
        end
      end

      unless row_rest.map(&:solution).include?(target)
        if row_rest.all? { |x| x.is_not.include?(target) }
          @solution = target
          @is_not = (1..9).to_a - [target]
        end
      end

      unless col_rest.map(&:solution).include?(target)
        if col_rest.all? { |x| x.is_not.include?(target) }
          @solution = target
          @is_not = (1..9).to_a - [target]
        end
      end

    end

  end

end

class Puzzle
  attr_accessor :cells

  def initialize(input_grid)
    input_grid.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        cell = Cell.new(col)
        grid_index = (col_index / 3)
        grid_index += 3 if row_index > 2
        grid_index += 3 if row_index > 5
        cell.position = [col_index, row_index, grid_index]
        cell.puzzle = self
        @cells ||= []
        @cells << cell
      end
    end
  end

  def repeat_calc
    foo = solved_count()
    calc()
    until foo == solved_count()
      foo = solved_count()
      calc()
      calc()
    end
    # show_off()
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
      cell.solution = number_guess
      cell.is_not = (1..9).to_a - [number_guess]
      repeat_calc()
      return if solved_count == 81
      guess(cell_index + 1)
      return if solved_count == 81
      @cells = saved
    end
  end

  def show_off(timer = 0)
    sleep 0.1
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

  def solved_count
    @cells.select(&:solution).compact.count
  end

  def to_s
    show_off
  end
end

puzzles = grids.map { |x| Puzzle.new(x) }

puzzles.each do |puzzle|
  puzzle.repeat_calc()
  puzzle.guess() if puzzle.solved_count < 81
end

firsts = puzzles.map { |x| x.cells.take(3).map(&:solution) }
int_vals = firsts.map { |x| x.join().to_i }
puts int_vals.reduce(:+)

# 24702
