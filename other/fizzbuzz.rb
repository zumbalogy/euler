require 'benchmark'


Benchmark.bmbm do |bm|

    bm.report("one line, ternary") do
        10_000.times do
            (1..100).map {|i| (i % 15).zero? ? 'Fizzbuzz' : (i % 5).zero? ? 'Fizz' : (i % 3).zero? ? 'Buzz' : i}
        end
    end

    bm.report("diff order ternary") do
        10_000.times do
            (1..100).map {|i| (i % 15).zero? ? 'Fizzbuzz' : (i % 3).zero? ? 'Buzz' : (i % 5).zero? ? 'Fizz' : i}
        end
    end

    bm.report("ternary, ==") do
        10_000.times do
            (1..100).map {|i| (i % 15 == 0) ? 'Fizzbuzz' : (i % 3 == 0) ? 'Buzz' : (i % 5 == 0) ? 'Fizz' : i}
        end
    end

    bm.report("ternary, ===") do
        10_000.times do
            (1..100).map {|i| (i % 15 === 0) ? 'Fizzbuzz' : (i % 3 === 0) ? 'Buzz' : (i % 5 === 0) ? 'Fizz' : i}
        end
    end

    bm.report("%%/||") do
        10_000.times do
            (1..100).map {|i| (i % 15 == 0 && 'Fizzbuzz') || (i % 3 == 0 && 'Buzz') || (i % 5 == 0 && 'Fizz') || i}
        end
    end

    bm.report("if, ==") do
        10_000.times do
            (1..100).map do |i| 
                if i % 15 == 0
                    'Fizzbuzz'
                elsif i % 3 == 0
                    'Buzz'
                elsif i % 5 == 0
                    'Fizz'
                else
                    i
                end
            end
        end
    end

end