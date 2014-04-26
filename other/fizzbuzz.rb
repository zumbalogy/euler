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

=begin

one line, ternary    0.410000   0.000000   0.410000 (  0.418258)
diff order ternary   0.420000   0.000000   0.420000 (  0.421008)
ternary, ==          0.360000   0.000000   0.360000 (  0.365817)  # 2nd
ternary, ===         0.400000   0.000000   0.400000 (  0.403612)
%%/||                0.390000   0.000000   0.390000 (  0.392194)
if, ==               0.360000   0.000000   0.360000 (  0.359847)  # 1st

--------------------------------------------- total: 2.340000sec


                         user     system      total        real
one line, ternary    0.410000   0.000000   0.410000 (  0.414797)
diff order ternary   0.410000   0.000000   0.410000 (  0.416263)
ternary, ==          0.360000   0.000000   0.360000 (  0.356994) # 2nd
ternary, ===         0.410000   0.000000   0.410000 (  0.410691)
%%/||                0.390000   0.000000   0.390000 (  0.385689)
if, ==               0.360000   0.000000   0.360000 (  0.353789) # 1st

=end