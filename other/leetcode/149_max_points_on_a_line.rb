# https://leetcode.com/problems/max-points-on-a-line/description/

# Given n points on a 2D plane,
# find the maximum number of points that lie on the same straight line.

# I will assume I am given unique points for now.

def intercepts(((x1, y1), (x2, y2)))
  return [x1, :undefined] if x1 == x2
  return [:undefined, y1] if y1 == y2
  m = (y2 - y1) / (x2 - x1).to_f
  b = y1 - (m * x1)
  x_intercept = -b.to_f / m
  [x_intercept, b]
end

def all_lines(points)
  out = []
  len = points.length
  len.times do |i|
    (len - (i + 1)).times do |j|
      out << [points[i], points[j]]
    end
  end
  out
end

points = 100.times.map { |_|  [(rand() * 10).to_i, (rand() * 10).to_i] }.uniq

lines = all_lines(points)
groups = lines.group_by(&method(:intercepts))
longest = groups.max_by { |a, b| b.length }
point_count = longest[1].flatten(1).uniq.count

p point_count
