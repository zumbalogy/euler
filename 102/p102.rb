# coding: utf-8
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

def o_ray_intersects?(((x1, y1), (x2, y2)))
  return false unless 0 > (y1 * y2)
  0 < x1 + ((x2 - x1) * ((- y1.to_f) / (y2 - y1)))
end

def tri_has_o?((a, b, c))
  [[a, b], [a, c], [b, c]].count(&method(:o_ray_intersects?)).odd?
end

puts triangles.count(&method(:tri_has_o?))
# 228
