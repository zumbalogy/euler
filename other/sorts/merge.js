function split(array){
    var output = []
    while (array.length > 1){
        output.push(sort_pair([array.shift(), array.shift()]))
    }
    if (array.length == 1){
        output.push([array.shift()])
    }
    return output
}

function sort_pair(array){
    array = array.filter(function(x){
        if (typeof(x) == 'number') {return true}
    })
    if (array.length > 1 && array[0] > array[1]) {
        return [array[1], array[0]]
    }
    return array
}

function merge(array1, array2){
    var output = []
    var save;
    if (array1 && array2) {
        var foo = array1.shift()
        var bar = array2.shift()
    }
    while (array1 && array2 && array1.length > 0 && array2.length > 0) {
        if (foo < bar){
            output.push(foo)
            foo = array1.shift()
            var save = foo;
        } else {
            output.push(bar)
            bar = array2.shift()
            var save = bar;
        }
    }
    output.push(save)
    while (array1 && array1.length > 0){
        output.push(array1.shift())
    }
    while (array2 && array2.length > 0){
        output.push(array2.shift())
    }
    return output
}

function mergeSort(array){
    var output = split(array);
    var count = output.length;
    for (var i = 0; i < count; i++){
        output[i] = merge(output[i], output[i+1])
        output.splice(i+1, 1)
    }
    return output
}