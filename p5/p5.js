// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

function gcd(a,b){
    if (b == 0) {
        return a
    } else {
        return gcd(b, a % b)
    }
}

function lcm(a, b){
    return (a * b) / gcd(a, b)
}

// var start = new Date().getTime();

// for (var x = 0; x < 50000; x++) {
    var total = 20;
    for (var i = 11; i < 20; i++) {
        total = lcm(total, i)
    };
// }

// var end = new Date().getTime();
// console.log(end-start); //this is milliseconds.

console.log(total); // 232792560


//  0.011 milliseconds for best in ruby once
//  30.000 ms to do in js 50,000 times
//  18.333 times faster in js, extrapolating
//  and note that rubies built in functions
//  were faster than writing our own, which we had to do here

// also note benchmarks are fuzzy thing