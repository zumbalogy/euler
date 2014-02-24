// The prime factors of 13195 are 5, 7, 13 and 29.

// What is the largest prime factor of the number 600851475143 ?

function is_prime(input){
    var output = true;
    for (var i = 2; i * i < input; i++){
        if (input % i == 0){
            output = false
        }
    }
    return output
}

function big_factor(input){
    var output;
    for (var i = 1; i * i < input; i++){
        if (input % i === 0 && is_prime(i)){
            output = i
        }
    }
    return output
}

console.log(big_factor(600851475143))