/*

Three distinct points are plotted at random on a Cartesian plane, for which -1000 ≤ x, y ≤ 1000, such that a triangle is formed.

Consider the following two triangles:

A(-340,495), B(-153,-910), C(835,-947)
X(-175,41), Y(-421,-714), Z(574,-645)

It can be verified that triangle ABC contains the origin, whereas triangle XYZ does not.

Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file containing the co-ordinates of one thousand "random" triangles, find the number of triangles for which the interior contains the origin.

NOTE: The first two examples in the file represent the triangles in the example given above.

*/

function sameSideO(p1, p2, p3) {
  var x1 = p1[0]
  var y1 = p1[1]
  var x2 = p2[0]
  var y2 = p2[1]
  var x3 = p3[0]
  var y3 = p3[1]
  m = (y2 - y1) / (x2 - x1)
  b = y1 - (m * x1)
  return (y3 > (m * x3) + b && 0 > b) || (y3 < (m * x3) + b && 0 < b)
}

function triHasO(p1, p2, p3) {
  sameSideO(p1, p2, p3) &&
  sameSideO(p2, p3, p1) &&
  sameSideO(p3, p1, p2)
}
