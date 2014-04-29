function qs(array){
    if (array.length <= 1){return array}
    var pivot  = array[0]
    var bottom = array.filter(function(x){return x < pivot})
    var middle = array.filter(function(x){return x == pivot})
    var top    = array.filter(function(x){return x > pivot})
    return qs(bottom).concat(middle.concat(qs(top)))
}