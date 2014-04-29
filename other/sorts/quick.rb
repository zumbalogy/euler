def qs array
    return array if array.length <= 1
    pivot = array.select {|n| n == array[0]}
    top = array.select {|n| n > pivot[0]}
    bottom = array.select {|n| n < pivot[0]}
    qs(bottom) + pivot + qs(top)
end