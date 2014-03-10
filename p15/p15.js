// Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.


// How many such routes are there through a 20×20 grid?

////////// see rb file for my thoughts
// the combination formula is
//   a! / b!(a-b)!


function fact(input, total){
    total = total || 1
    if (input > 1)
        return fact(input - 1, total * input)
    return total
}

function combination(foo,bar){
    return fact(foo) / (fact(bar) * fact(foo - bar))
}

console.log(combination(40, 20))

// 137846528820.00003
// should not have the .00003 but thats just how it do
