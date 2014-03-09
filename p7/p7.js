// What is the 10 001st prime number? (not including one)


function prime(input){
    for (var i = 2; i <= Math.sqrt(input); i++){
        if (input % i == 0){
            return false
            break
        }
    }
    return true
}

var count = 1;

for (var i = 3; count < 10001; i += 2){
    prime(i) && count ++
}

console.log(i)

// 104724
