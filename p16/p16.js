// 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

// What is the sum of the digits of the number 2^1000?

/////////////////////////

// binary 
// 2 = 2^1 = 10
// 4 = 2^2 = 100
// 8 = 2^3 = 1000

function bin2dec(num){
    return num.split('').reverse().reduce(function(x, y, i){
        return (y === '1') ? x.toString() + Math.pow(2, i) : x.toString()
    })
}



console.log(bin2dec('1000'))