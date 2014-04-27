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

    low    = -1
    top    = -1
    output = -1

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

def deviate_recur array, amount_input, best = 0
    split = array.pop(amount_input)
    diff = split.max - split.min
    best = [best, diff].max
    array.any? ? deviate_recur(array, amount_input, best) : best
end

#########################################################

def deviate_simple_loop array, amount_input

end

#########################################################

p deviation([6, 9, 4, 7, 4, 1], 3)
# => 6

p deviation2([6, 9, 4, 7, 4, 1], 3)
# => 6

p deviate_recur([6, 9, 4, 7, 4, 1], 3)
# => 6