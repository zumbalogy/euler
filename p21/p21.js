// Let d(n) equal the sum of divisors of n.

// If d(a) = b and d(b) = a, where a ≠ b, then a and b are called amicable numbers.

// For example, the divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; so d(220) = 284. The divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

// Evaluate the sum of all the amicable numbers under 10000.

//////////////// d(a) = b and d(b) = a, where a ≠ b
//////////////// d(d(a)) = a

function sum_div(input){
    var total = [0];
    for (var i = 1; i < input; i++){ // should prbably be sq root thing
        if (input % i == 0){
            total.push(i);
        }
    }
    return total.reduce(function(a, b){return a + b})
}


console.log(sum_div(220))

var array = []

for (var i = 0; i < 10000; i++){
    var first = sum_div(i)
    var second = sum_div(first)
    if (second == i && first != i){
        array.push(i)
    }
}

console.log(array.reduce(function(a, b){return a + b}))
// 31626