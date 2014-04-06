# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28_123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

########################

# The first odd abundant number not divisible by 5 is 81_081
# 


def abundant? input
    	a = 0
	(2..Math.sqrt(input)).each do |foo|
		a += (foo + (input / foo)) if (input % foo).zero?
		if a > input
			return true
		end
	end
	return false
end

def made_from_abundant? input
    return false if input.odd? && input % 5 == 0
    (1..(input/2)).each do |first|
        if abundant?(first) && abundant?(input - first)
            return true
        end
    end
    return false
end

puts abundant? 11
puts abundant? 12
puts abundant? 18
puts abundant? 28
puts made_from_abundant? 30
puts
puts made_from_abundant? 24

total = 0

#(12..28_123).each do |i|
 #   p i
  #  total += i unless made_from_abundant?(i)
#end

p total
# 3_921_457 
# turns out this is way too much
# and currently takes over 6 minutes
