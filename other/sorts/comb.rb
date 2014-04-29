def comb_sort array
    array.count.times do |pass|
        foo = array.count - pass
        array.each_index do |index|
            if array[index + foo]
                a = array[index]
                b = array[index + foo]
                if a > b
                    array[index] = b
                    array[index + foo] = a
                end
            end
        end
    end
    array
end