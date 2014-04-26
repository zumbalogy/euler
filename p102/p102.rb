class Line
    def initialize x1, y1, x2, y2
        @slope = (x2 - x1) / (y2 - y1).to_f
        @intercept = y1 - (@slope * x1)
    end
end

triangles = File.readlines('./triangles.txt').map do |line|
    tri = line.split(',').map(&:to_i)
    [[tri[0],tri[1]],[tri[2],tri[3]],[tri[4],tri[5]]]
end

def same_side_as_origin?(p1, p2, p3)
  m = (p2[1] - p1[1]) / (p2[0] - p1[0]).to_f
  b = p1[1] - (m * p1[0])
  (p3[1] > m * p3[0] + b && 0 > b) ||
  (p3[1] < m * p3[0] + b && 0 < b)
end

def tri_has_o?(tri)
  same_side_as_origin?(tri[0], tri[1], tri[2]) &&
  same_side_as_origin?(tri[0], tri[2], tri[1]) && 
  same_side_as_origin?(tri[1], tri[2], tri[0])
end

p triangles.count &method(:tri_has_o?)