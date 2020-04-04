/*
Three distinct points are plotted on a Cartesian plane, for which -1000 ≤ x, y ≤ 1000, forming a triangle.

Consider the following two triangles:
A(-340,495), B(-153,-910), C(835,-947)
X(-175,41), Y(-421,-714), Z(574,-645)

It can be verified that triangle ABC contains the origin, whereas triangle XYZ does not.

Using triangles.txt, a text file containing the co-ordinates of a thousand "random" triangles, find the number of triangles which contain the origin.
*/

var fs = require('fs')

function readTriangles(file) {
  var tris = fs.readFileSync(file, 'utf8').split('\n')
  return tris.map(function(tri) {
    return tri.split(',').map(Number)
  })
}

function sameSideO(x1, y1, x2, y2, x3, y3) {
  var m = (y2 - y1) / (x2 - x1)
  var b = y1 - (m * x1)
  var yIntercept = (m * x3) + b
  return y3 > yIntercept == b < 0
}

function triHasO(t) {
  return sameSideO(t[0], t[1], t[2], t[3], t[4], t[5]) &&
  sameSideO(t[2], t[3], t[4], t[5], t[0], t[1]) &&
  sameSideO(t[4], t[5], t[0], t[1], t[2], t[3])
}

var triangles = readTriangles(__dirname + '/triangles.txt')

console.log(triangles.filter(triHasO).length)
// 228
