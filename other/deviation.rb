=begin

https://gist.github.com/matthewrudy/8677812

Given an array of integer elements and an integer d please consider all the sequences of d consecutive elements in the array. For each sequence we compute the difference between the maximum and the minimum value of the elements in that sequence and name it the deviation.

Your task is to;

write a function that computes the maximum value among the deviations of all the sequences considered above
print the value the standard output (stdout)
Note that your function will receive the following arguments:

v which is the array of integers
d which is an integer value giving the length of the sequences

the array will contain up to 100,000 elements all the elements in the array are integer numbers in the following range: [1, 231 -1] the value of d will not exceed the length of the given array

Input:
v: 6, 9, 4, 7, 4, 1
d: 3

Output:
6

=end


def deviation array, amount_input
    amount = amount_input - 1

    low    = -1
    top    = -1
    output = -1

    array.each_with_index do |n, index|
        if n > low || top < n
            start   = amount < index ? index - amount : 0
            second  = array[start..index + amount]

            low_diff = n - second.min
            top_diff = n - second.max

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

def deviate_recur array, amount_input, best = 0
    split = array.pop(amount_input)
    diff = split.max - split.min
    best = diff if diff > best
    array.any? ? deviate_recur(array, amount_input, best) : best
end

p deviation([6, 9, 4, 7, 4, 1], 3)
# => 6

p deviate_recur([6, 9, 4, 7, 4, 1], 3)
# => 6