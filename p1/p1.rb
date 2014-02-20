# euler prob number 1

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.


total = 0
1000.times do |n|
    if n % 5 == 0 || n % 3 == 0
        total += n
    end
end

p total

# ruby p1.rb
# =>  233168



