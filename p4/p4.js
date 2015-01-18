// Find the largest palindome number (9009) that is the product of 2 3-diget numbers.

function is_pal(input){
  var string = input.toString();
  var len = string.length;

  for (var i = 0; i < len; i++) {
    if (string[i] != string[len - (1 + i)]) {
      return false
    }
  }
  return true
}

var output = 0;

for (var x = 999; x > 99; x--) {
  for (var y = 999; y > 99; y--) {
    var current = x * y;
    if (current > output && is_pal(current)) {
      output = current
    }
  }
}

console.log(output)
// 906609
// 913 * 993
