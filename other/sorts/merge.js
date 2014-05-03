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
    array2 = array2 || []
    var output = []
    if (array1 && array2){
        while (array1.length && array2.length){
            if (array1[0] < array2[0]){
                output.push(array1.shift())
            } else {
                output.push(array2.shift())
            }
        }
        while (array1.length){
            output.push(array1.shift())
        }
        while (array2.length){
            output.push(array2.shift())
        }
    }
    return output
}

function mergeSort(array){
    var output = split(array);
    while (output.length > 1){
        var new_array = []
        while (output.length){
            new_array.push(merge(output.shift(),output.shift()))
        }
        output = new_array
    }
    return output[0]
}