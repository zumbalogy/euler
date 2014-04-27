=begin

https://gist.github.com/matthewrudy/8677812

Given an array of integer elements and an integer d please consider all the sequences of d consecutive elements in the array. For each sequence we compute the difference between the maximum and the minimum value of the elements in that sequence and name it the deviation.

Write a function that computes the maximum value among the deviations of all the sequences considered above

The function will receive the following arguments:

v which is the array of integers
d which is an integer value giving the length of the sequences

The array will contain up to 100,000 elements all the elements in the array are integer numbers in the following range: [1, 231 -1] the value of d will not exceed the length of the given array

Input:
v: 6, 9, 4, 7, 4, 1
d: 3

Output:
6

=end

#########################################################

def deviation array, amount
    # this method skims over the array
    # not making calculations until theres a number
    # outside of the range of it current best diff input numbers
    amount -= 1

    low, top, output = -1,-1,-1

    array.each_with_index do |n, index|
        if n < low || top < n
            # important numbers could lie behind, but must avoid
            # looking further back than the array starts
            start   = amount < index ? index - amount : 0
            second  = array[start..index + amount]

            low_diff = n - second.min
            top_diff = second.max - n

            if output < low_diff
                low    = second.min
                top    = n
                output = low_diff
            elsif output < top_diff
                low    = n
                top    = second.max
                output = top_diff
            end
        end
    end
    output
end

###########################################################

def deviation2 array, amount
    amount -= 1
    low = top = output = -1

    array.each_with_index do |n, index|
        if top < n
            start = amount < index ? index - amount : 0
            min   = array[start..index + amount].min
            diff  = n - min

            if output < diff
                low    = min
                top    = n
                output = diff
            end
        elsif n < low
            start = amount < index ? index - amount : 0
            max   = array[start..index + amount].max
            diff  = max - n

            if output < diff
                low    = n
                top    = max
                output = diff
            end
        end
    end
    output
end

#########################################################

def deviate_recur array, amount, best = 0
    split = array.pop(amount)
    diff = split.max - split.min
    best = [best, diff].max
    array.any? ? deviate_recur(array, amount, best) : best
end

#########################################################

def deviate_simple array, amount
    output = 0
    array.each_with_index do |n, idx|
        foo = array[idx..(idx + amount)]
        output = [output, foo.max - foo.min].max
    end
    output
end

#########################################################

p deviation([6, 9, 4, 7, 4, 1], 3)
# => 6

p deviation2([6, 9, 4, 7, 4, 1], 3)
# => 6

p deviate_recur([6, 9, 4, 7, 4, 1], 3)
# => 6

p deviate_simple([6, 9, 4, 7, 4, 1], 3)
# => 6

#######################################################

require 'benchmark'

Benchmark.bmbm do |bm|
    bm.report('deviation') do
        1000.times do
            deviation([6, 9, 4, 7, 4, 1], 3)
            deviation([6, 9, 4, 7, 4, 1, 1, 1, 8, 1, 1, 1, 1], 4)
            deviation([6,9,4,7,4,1,1,1,8,1,1,1,1,9,6,2,4,2,7,5,6,8,9,5,2,1,5,8], 5)
        end
    end
    bm.report('deviation2') do
        1000.times do
            deviation2([6, 9, 4, 7, 4, 1], 3)
            deviation2([6, 9, 4, 7, 4, 1, 1, 1, 8, 1, 1, 1, 1], 4)
            deviation2([6,9,4,7,4,1,1,1,8,1,1,1,1,9,6,2,4,2,7,5,6,8,9,5,2,1,5,8], 5)
        end
    end
    bm.report('recur') do
        1000.times do
            deviate_recur([6, 9, 4, 7, 4, 1], 3)
            deviate_recur([6, 9, 4, 7, 4, 1, 1, 1, 8, 1, 1, 1, 1], 4)
            deviate_recur([6,9,4,7,4,1,1,1,8,1,1,1,1,9,6,2,4,2,7,5,6,8,9,5,2,1,5,8], 5)
        end
    end
    bm.report('simple') do
        1000.times do
            deviate_simple([6, 9, 4, 7, 4, 1], 3)
            deviate_simple([6, 9, 4, 7, 4, 1, 1, 1, 8, 1, 1, 1, 1], 4)
            deviate_simple([6,9,4,7,4,1,1,1,8,1,1,1,1,9,6,2,4,2,7,5,6,8,9,5,2,1,5,8], 5)
        end
    end
end

=begin

Rehearsal ----------------------------------------------
deviation    0.040000   0.000000   0.040000 (  0.032148)
deviation2   0.020000   0.000000   0.020000 (  0.020308) # 1st
recur        0.030000   0.000000   0.030000 (  0.033493)
simple       0.130000   0.000000   0.130000 (  0.125517)
------------------------------------- total: 0.220000sec

                 user     system      total        real
deviation    0.030000   0.000000   0.030000 (  0.032484)
deviation2   0.020000   0.000000   0.020000 (  0.018630) # 1st
recur        0.030000   0.000000   0.030000 (  0.031820)
simple       0.120000   0.000000   0.120000 (  0.124611)

recur does much better relativly when array is short

=end