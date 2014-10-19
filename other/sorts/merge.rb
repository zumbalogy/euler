def sort_pair array
    return array if array.length == 1
    [array.min, array.max]
end

def merge (foo, bar = [])
    output = []
    until foo.empty? || bar.empty?
        if foo.first < bar.first
            output << foo.shift
        else
            output << bar.shift
        end
    end
    until foo.empty? && bar.empty?
        output << foo.shift
        output << bar.shift
    end
    output.compact
end

def split array
    output = []
    until array.empty?
        output << [array.shift, array.shift].compact
    end
    output
end

def merge_sort array
    save = split(array).map(&method(:sort_pair))
    while save.count > 1
        save.each_index do |i|
            save[i] = merge(save[i], save.delete_at(i + 1))
        end
    end
    save[0]
end

a = [3,2,5,3,1,100, 0]

p merge_sort(a)
# => [0, 1, 2, 3, 3, 5, 100]
