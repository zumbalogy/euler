=begin

Three distinct points are plotted on a Cartesian plane, for which -1000 ≤ x, y ≤ 1000, forming a triangle.

Consider the following two triangles:
A(-340,495), B(-153,-910), C(835,-947)
X(-175,41), Y(-421,-714), Z(574,-645)

It can be verified that triangle ABC contains the origin, whereas triangle XYZ does not.

Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file containing the co-ordinates of one thousand "random" triangles, find the number of triangles for which the interior contains the origin.

=end

triangles = File.readlines(File.dirname($0) + '/triangles.txt').map do |line|
  x1, y1, x2, y2, x3, y3 = line.split(',').map(&:to_i)
  [[x1, y1], [x2, y2], [x3, y3]]
end

def same_side_as_origin?((x1, y1), (x2, y2), (x3, y3))
  m = (y2 - y1) / (x2 - x1).to_f
  b = y1 - (m * x1)
  y3 > (m * x3) + b == 0 > b
end

def tri_has_o?((p1, p2, p3))
  same_side_as_origin?(p1, p2, p3) &&
  same_side_as_origin?(p1, p3, p2) &&
  same_side_as_origin?(p2, p3, p1)
end

puts triangles.count(&method(:tri_has_o?))
# 228
