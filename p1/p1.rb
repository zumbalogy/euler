# euler prob number 1

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

require 'benchmark'

total = 0

(0..1000).step(3)  { |n| total += n }
(0..1000).step(5)  { |n| total += n }
(0..1000).step(15) { |n| total -= n }

p total

# ruby p1.rb
# =>  233168


# should try doing a set so that ones i am addind have to be unique
# then reduce? probably slower

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
        total = 0
        (0..1000).step(3) do |n|
            total += n
        end
        (0..1000).step(5) do |n|
            total += n if n % 3 != 0
        end
    end
    bm.report('range step & unless whithout each') do
        total = 0
        (0..1000).step(3) do |n|
            total += n
        end
        (0..1000).step(5) do |n|
            total += n unless n % 3 == 0
        end
    end
    bm.report('exact same (to see variance)') do
        total = 0
        (0..1000).step(3) do |n|
            total += n
        end
        (0..1000).step(5) do |n|
            total += n unless n % 3 == 0
        end
    end
    bm.report('same with 3 dots') do
        total = 0
        (0...1000).step(3) do |n|
            total += n
        end
        (0...1000).step(5) do |n|
            total += n unless n % 3 == 0
        end
    end
    bm.report('just killing 15s') do
        total = 0
        (0..1000).step(3) do |n|
            total += n
        end
        (0..1000).step(5) do |n|
            total += n
        end
        (0..1000).step(15) do |n|
            total -= n
        end
    end
    bm.report('kill 15 braces') do
        (0..1000).step(3) { |n| total += n }
        (0..1000).step(5) { |n| total += n }
        (0..1000).step(15) { |n| total -= n }
    end
end

# these all vary by a bit but:


# Rehearsal ---------------------------------------------------------------------
# array without step                  0.000000   0.000000   0.000000 (  0.000222)
# range without step                  0.000000   0.000000   0.000000 (  0.000221)
# range with step                     0.000000   0.000000   0.000000 (  0.000081)
# range with step whtout each         0.000000   0.000000   0.000000 (  0.000067)
# range step & unless whithout each   0.000000   0.000000   0.000000 (  0.000067)
# exact same (to see variance)        0.000000   0.000000   0.000000 (  0.000067)
# same with 3 dots                    0.000000   0.000000   0.000000 (  0.000064)
# just killing 15s                    0.000000   0.000000   0.000000 (  0.000061)
# kill 15 braces                      0.000000   0.000000   0.000000 (  0.000061)
# ------------------------------------------------------------ total: 0.000000sec

#                                         user     system      total        real
# array without step                  0.000000   0.000000   0.000000 (  0.000217)
# range without step                  0.000000   0.000000   0.000000 (  0.000218)
# range with step                     0.000000   0.000000   0.000000 (  0.000096)
# range with step whtout each         0.000000   0.000000   0.000000 (  0.000082)
# range step & unless whithout each   0.000000   0.000000   0.000000 (  0.000071)
# exact same (to see variance)        0.000000   0.000000   0.000000 (  0.000111)
# same with 3 dots                    0.000000   0.000000   0.000000 (  0.000080)
# just killing 15s                    0.000000   0.000000   0.000000 (  0.000066)
# kill 15 braces                      0.000000   0.000000   0.000000 (  0.000063)
