function split(array){
    var output = []
    while (array.length > 0){
        var foo = sort_pair([array.shift(), array.shift()])
        output.push(foo)
    }
    return output
}

function sort_pair(array){
    array = array.filter(function(x){
        if (x) {return x}
    })
    if (array.length > 1 && array[0] > array[1]) {
        return [array[1], array[0]]
    }
    return array
}

function merge(array1, array2){
    var foo = array1.shift()
    var bar = array2.shift()
    var output = []
    while (array1.length > 0 && array2.length > 0) {
        if (foo < bar){
            output.push(foo)
            foo = array1.shift()
        } else {
            output.push(bar)
            bar = array2.shift()
        }
    }
}

function mergeSort(array){

}