// What is the 10 001st prime number? (not including one)


function prime(input){
    var output = true;
    for (var i = 2; i <= Math.sqrt(input); i++){
        if (input % i == 0){
            output = false
        }
    }
    return output
}

var answer = 0;
var count = 0;

for (var i = 0; count < 10001; i++){
    if (prime(i)){
        count ++;
        answer = i
    }
}

console.log(i)

// 104724
