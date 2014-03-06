// look for the largest palindome number (9009) that
// is the product of 2 3-diget numbers.

// 906609
// 913 * 993

function is_pal(input){
    var palness = true;
    var string = input.toString();
    var len = string.length;

    for (var i = 0; i < len; i++){
        var end = string[len - (i+1)];
        if (string[i] != end){
            palness = false
        }
    }

    return palness
}

var output = 0;

for (var x = 100; x < 1000; x++){
    for (var y = 100; y < 1000; y++) {
        var foo = x * y;
        if (foo > output && is_pal(foo)){
            output = foo
        }
    }
};

console.log(output)

// var sadf = 897;
// console.log(is_pal(sadf))