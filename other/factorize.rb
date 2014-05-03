def factorize(input, output = [])
    return (output << input) if input.prime?
    p = Prime.new
    until input % p == 0
        p.next
    end
    output << p
    factorize(input/p, output)
end

def factorize(input)  
    p = Prime.new(2)
    output = []
    foo = input
    until p > foo
        while foo % p == 0
            output << p 
            foo = foo / p
        end
        p.next
    end
    output
end

