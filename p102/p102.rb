=begin

Three distinct points are plotted at random on a Cartesian plane, for which -1000 ≤ x, y ≤ 1000, such that a triangle is formed.

Consider the following two triangles:

A(-340,495), B(-153,-910), C(835,-947)

X(-175,41), Y(-421,-714), Z(574,-645)

It can be verified that triangle ABC contains the origin, whereas triangle XYZ does not.

Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file containing the co-ordinates of one thousand "random" triangles, find the number of triangles for which the interior contains the origin.

NOTE: The first two examples in the file represent the triangles in the example given above.

=end

##############################################################

triangles = File.readlines('./triangles.txt').map do |line|
    tri = line.split(',').map(&:to_i)

    # create a triangle array of three points
    #   points are an array with [x, y] values.
    [[tri[0],tri[1]],[tri[2],tri[3]],[tri[4],tri[5]]]
end

######################################################

def same_side_as_origin?((x1, y1), (x2, y2), (x3, y3))
    # point 1 & 2 make line, point 3 compared to origin

    # slope (m) = (y2 -y1) / (x2 - x1)
    m = (y2 - y1) / (x2 - x1).to_f
    
    # y-intercept (b) = y1 - (m * x1)
    b = y1 - (m * x1)

    # y > (mx + b) AND (origin y) > (m(origin x) + b)
    #   or both less than
    #   origin x and origin y are zero, so are simplified
    (y3 > (m * x3) + b && 0 > b) ||
    (y3 < (m * x3) + b && 0 < b)
end

def tri_has_o?((p1, p2, p3))
    # look at the 3 lines of a tringle, and compare
    #   origin to the point of triangle not on givin line
    #   iff true all times, point (origin) is contained
    same_side_as_origin?(p1, p2, p3) &&
    same_side_as_origin?(p1, p3, p2) && 
    same_side_as_origin?(p2, p3, p1)
end

p triangles.count &method(:tri_has_o?)

######################################################

class Line
    def initialize x1, y1, x2, y2
        @slope = (x2 - x1) / (y2 - y1).to_f
        @intercept = y1 - (@slope * x1)
    end

end

