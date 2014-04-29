function combSort(array){
    for (var x = array.length; x > 0; x--){
        for (var y = 0; y < array.length; y++){
            var foo = array[y]
            var bar = array[y + x]
            if (bar && foo > bar){
                array[y] = bar
                array[y + x] = foo
            }
        }
    }
    return array
}