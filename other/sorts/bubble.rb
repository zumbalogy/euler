def bs array
    array.count.times do
        array.each_index do |i|
            if foo = array[i + 1]
                bar = array[i]
                if foo < bar
                    array[i] = foo
                    array[i + 1] = bar
                end
            end
        end
    end
    array
end
