// What is the 10 001st prime number? (not including one)

function prime(input){
    if (input % 2 == 0)
        return false
    for (var i = 3; i <= Math.sqrt(input); i += 2)
        if (input % i == 0)
            return false
    return true
}

var count = 0
var i = 1

while (count < 10000) {
    i += 2
    prime(i) && count ++
}

console.log(i)
// 104743

