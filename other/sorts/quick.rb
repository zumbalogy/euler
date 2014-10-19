def qs array
    return array if array.length <= 1
    pivot  = array.sample

    top    = array.select {|n| n > pivot}
    middle = array.select {|n| n == pivot}
    bottom = array.select {|n| n < pivot}

    qs(bottom) + middle + qs(top)
end
