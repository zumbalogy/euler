// What is the 10 001st prime number? (not including one)


function prime(input){
    if (input % 2 == 0)
        return false
    for (var i = 3; i <= Math.sqrt(input); i += 2){
        if (input % i == 0){
            return false
        }
    }
    return true
}

var count = 2;

for (var i = 3; count < 10000; i += 2){
    prime(i) && count ++
}

console.log(i-2) // -2 because loop will add two to it at the end
                 //  could set and reset a variably when i is prime, but thats slower 

// 104723
