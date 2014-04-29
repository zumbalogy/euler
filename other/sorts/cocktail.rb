def cocktail array
    array.count.times do |pass|
        if pass.even?
            array.count.times do |i|
                if foo = array[i + 1]
                    bar = array[i]
                    if foo < bar
                        array[i] = foo
                        array[i + 1] = bar
                    end
                end
            end
        else
            (1..array.count).each do |i|
                if foo = array[-i - 1]
                    bar = array[-i]
                    if foo > bar
                        array[-i - 1] = bar
                        array[-i] = foo
                    end
                end
            end
        end
    end
    array
end