// The Fibonacci sequence is defined by the recurrence relation:

// Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
// Hence the first 12 terms will be:
// 1 1 2 3 5 8 13 21 34 55 89 144

// The 12th term, 114, is the first term to contain three digits.

// What is the first term in the Fibonacci sequence to contain 1000 digits?

function crazyAdd(a, b) {
  a = a.reverse()
  b = b.reverse()
  for(var i = 0; i < b.length; i++) {
    if(a[i]) {
      b[i] += a[i]
    }
    if(b[i] > 9) {
      b[i] -= 10
      b[i + 1] = (b[i + 1] || 0) + 1
    }
  }
  return b.reverse()
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
// 4782

// correct is 4780
