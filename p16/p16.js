// 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

// What is the sum of the digits of the number 2^1000?

/////////////////////////

// binary 
// 2 = 2^1 = 10
// 4 = 2^2 = 100
// 8 = 2^3 = 1000


  // 1011=(1*2^3)+(0*2^2)+(1*2^1)+(1*2^0)
  //     = (1*8) + (0*4) + (1*2) + (1*1)
  // = 11 (in decimal notation)


// function bin2dec(num){
//     return num.split('').reverse().reduce(function(x, y, i){
//         return (y === '1') ? x + Math.pow(2, i) : x
//     }, 0)
// }


// console.log(bin2dec('10100'))


var array = [1];

for (var a = 0; a < 1000; a++){ //1000.times do |a|

    while (array[0] == 0)
        array.shift()

    var overflow = 0;
    var length = array.length + 1
    
    for (var b = 1; b < length; b++){ // gonning through backwards

        var digit = (array[array.length - b] * 2) + overflow
        overflow = Math.floor(digit / 10)
        array[array.length - b] = digit % 10
        if (b == array.length)
            array.unshift(overflow)
    }
}

var solution = array.reduce(function(a, b){
    return a + b 
})

console.log(solution)
// 1366
