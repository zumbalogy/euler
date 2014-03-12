// n! means n × (n − 1) × ... × 3 × 2 × 1

// For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
// and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

// Find the sum of the digits in the number 100!

//////////////////////

// js will not hold a number that big as a number, so we are going to
// construct an array of all that number's digits. starting from an array
// of one and simulating multiplication by pen and paper

var array = [1]
var overflow = 0

for (var a = 2; a < 101; a++){
    var len = array.length
    for (var b = 1; b <= len; b++){
        var start = (array[array.length - b] * a) + overflow
        overflow = Math.floor(start / 10)
        array[array.length - b] = start % 10
        if (b == len)
            while (overflow > 0){
                array.unshift(overflow % 10)
                overflow = Math.floor(overflow / 10)
            }
    }
}

var total = array.reduce(function(a,b){return a+b})

console.log(total)
// 648

