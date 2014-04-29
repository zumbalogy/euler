def bs array
    array.count.times do
        array.each_index do |i|
            if foo = array[i + 1]
                bar = array[i]
                if foo > bar
                    array[i] = bar
                    array[i + 1] = foo
                end
            end
        end
    end
end
