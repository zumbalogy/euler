// Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
// 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

// Sum the even terms in the Fibonacci sequence under four million

var start = [0, 1]
var total = 0

while (start[1] < 4000000){
  start.push(start[0] + start[1])
  if (start[1] % 2 == 0) { total += start[1] }
  start.shift()
}

console.log(total)
// 4613732

///////////////////////////////////

var a = 0;
var b = 1;
var total2 = 0;

while (b < 4000000) {
  if (b % 2 == 0) {
    total2 += b
  }
  var save = b;
  b += a;
  a = save;
}

console.log(total2)
// 4613732
