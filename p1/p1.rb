# euler prob number 1

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

require 'benchmark'

total = 0

(0..1000).step(3) do |n|
    total += n
end
(0..1000).step(5) do |n|
    total += n unless n % 3 == 0
end

p total

# ruby p1.rb
# =>  233168




Benchmark.bmbm do |bm|
    bm.report('array without step') do
        total = 0
        1000.times do |n|
            if n % 5 == 0 || n % 3 == 0
                total += n
            end
        end
    end
    bm.report('range without step') do
        total = 0
        (1..1000).each do |n|
            if n % 5 == 0 || n % 3 == 0
                total += n
            end
        end
    end
    bm.report('range with step') do
        total = 0
        (0..1000).step(3).each do |n|
            total += n
        end
        (0..1000).step(5).each do |n|
            total += n if n % 3 != 0
        end
    end
    bm.report('range with step whtout each') do
        1000.times do
            total = 0
            (0..1000).step(3) do |n|
                total += n
            end
            (0..1000).step(5) do |n|
                total += n if n % 3 != 0
            end
        end
    end
    bm.report('range step & unless whithout each') do
        1000.times do
            total = 0
            (0..1000).step(3) do |n|
                total += n
            end
            (0..1000).step(5) do |n|
                total += n unless n % 3 == 0
            end
        end
    end
    bm.report('exact same (to see variance)') do
        1000.times do
            total = 0
            (0..1000).step(3) do |n|
                total += n
            end
            (0..1000).step(5) do |n|
                total += n unless n % 3 == 0
            end
        end
    end
    bm.report('same with 3 dots') do
        1000.times do
            total = 0
            (0...1000).step(3) do |n|
                total += n
            end
            (0...1000).step(5) do |n|
                total += n unless n % 3 == 0
            end
        end
    end
end

        # 1000.times do
        #     total = 0
        #     (0..1000).step(3) do |n|
        #         total += n
        #     end
        #     (0..1000).step(5) do |n|
        #         total += n unless n % 3 == 0
        #     end
        # end

    # is winner (second to last)


# Rehearsal ---------------------------------------------------------------------
# array without step                  0.000000   0.000000   0.000000 (  0.000216)
# range without step                  0.000000   0.000000   0.000000 (  0.000216)
# range with step                     0.000000   0.000000   0.000000 (  0.000079)
# range with step whtout each         0.070000   0.000000   0.070000 (  0.064921)
# range step & unless whithout each   0.060000   0.000000   0.060000 (  0.063351)
# exact same (to see variance)        0.060000   0.000000   0.060000 (  0.062443)
# same with 3 dots                    0.060000   0.000000   0.060000 (  0.061924)
# ------------------------------------------------------------ total: 0.250000sec

#                                         user     system      total        real
# array without step                  0.000000   0.000000   0.000000 (  0.000258)
# range without step                  0.000000   0.000000   0.000000 (  0.000219)
# range with step                     0.000000   0.000000   0.000000 (  0.000076)
# range with step whtout each         0.060000   0.000000   0.060000 (  0.064612)
# range step & unless whithout each   0.070000   0.000000   0.070000 (  0.062428)
# exact same (to see variance)        0.060000   0.000000   0.060000 (  0.062004)
# same with 3 dots                    0.060000   0.000000   0.060000 (  0.062959)
