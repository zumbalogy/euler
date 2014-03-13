# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28_123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.


def abundant? input
    input < (2..Math.sqrt(input)).inject(0) do |a,b| 
        input % b == 0 ? a + b + (input / b) : a
    end
end

def made_from_abundant? input
    (1..(input/2)).each do |first|
        second = input - first
        if abundant?(first) && abundant?(second)
            return true
        end
    end
    return false
end


puts made_from_abundant? 23

total = 0

(12..28_123).each do |i|
    p i
    total += i unless made_from_abundant?(i)
end

p total
# 3921457
# but currently takes over 6 minutes
