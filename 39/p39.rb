# P is the perimeter of a right angle triangle with integral length sides, {a, b, c}. There are three solutions for p = 120.

# {20, 48, 52}, {24, 45, 51}, {30, 40, 50}

# For which value of p ≤ 1000, is the number of solutions maximised?

def solution_count(total)
  output = 0
  (0..(total / 3)).each do |a|
    (a..((total - a) / 2)).each do |b|
      c = Math.sqrt((a * a) + (b * b))
      output += 1 if a + b + c == total
    end
  end
  output
end

def max_solution_count(limit)
  output = [0, 0]
  limit.times do |time|
    current_count = solution_count(time)
    output = [time, current_count] if current_count > output.last
  end
  output.first
end

puts max_solution_count(1001)
