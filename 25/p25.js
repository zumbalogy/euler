// The Fibonacci sequence is defined by the recurrence relation:

// Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
// Hence the first 12 terms will be:
// 1 1 2 3 5 8 13 21 34 55 89 144

// The 12th term, F12, is the first term to contain three digits.

// What is the first term in the Fibonacci sequence to contain 1000 digits?

function digitCount(n) {
  return n.toString().length
}

function crazyAdd(a, b) {
  var len = b.length
  while(a.length < len) {
    a.unshift(0)
  }
  // could combine these 2 for loops into one where it just keeps track of the carry the first time around
  for(var i = 0; i < len; i++) {
    if(a[i]) {
      b[i] += a[i]
    }
  }
  for(var i = len - 1; i > 0; i--) {
    var current = b[i]
    if(current > 9) {
      b[i] = current - 10
      b[i - 1] = b[i - 1] + 1
    }
  }
  var first = b.shift()
  first = first.toString().split('').map(function(d) { return parseInt(d) })
  while(first.length > 0) {
    b.unshift(first.pop())
  }
  return b
}

function firstFibOfLength(len) {
  var fibs = [[1], [2]]
  var count = 3
  while(fibs[1].length < len) {
    fibs.push(crazyAdd(fibs[0].slice(0), fibs[1].slice(0)))
    fibs.shift()
    count++
  }
  return count
}

console.log(firstFibOfLength(1000))
