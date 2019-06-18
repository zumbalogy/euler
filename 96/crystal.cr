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
  out = [] of Int32
  indexes.each { |x| out << Cells[x + offset] }
  out
end

def row_rest(idx)
  offset = (idx / 9) * 9
  idxs = (offset...(offset + 9)).to_a
  idxs.delete_at(idx - offset)
  out = [] of Int32
  idxs.each { |x| out << Cells[x] }
  out
end

def grid_rest(idx)
  col = idx % 9
  row = idx / 9
  grid = (3 * (row / 3)) + (col / 3)

  offset = ((grid / 3) * 27) + (grid % 3) * 3
  idxs = [0, 1, 2, 9, 10, 11, 18, 19, 20]
  out = [] of Int32
  idxs.each { |x| out << Cells[x + offset] }
  out
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

text = File.read("sudoku.txt")

puzzle_chunks = text.strip.lines.each_slice(10).map { |x| x[1..10].join().split("").map {|s| s.to_i } }

puzzle_chunks.each do |chunk|
  initialize_cells(chunk)
  solve()
  corner = Cells.first(3).map { |x| cell_key[solution(x)] }
  euler_output += corner.join.to_i
end

puts euler_output
