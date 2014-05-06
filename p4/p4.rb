# look for the largest palindome number (9009) that
# is the product of 2 3-digit numbers.

output = 0

(100..999).each do |foo|
    (foo..999).each do |bar|
        foobar = foo * bar
        if foobar > output && foobar.to_s.reverse.to_i == foobar
            output = foobar
        end
    end
end


puts output
# 906609
# 913 * 993


###########################################

# could step down from 998001 until hit palindromes, and then see if they
# factor into 2 3digit nums

start = 999 * 999

def is_pal? input
    input.to_s.reverse.to_i == input
end

def facts_to_2_3s input
    (100..999).each do |i|
        if input % i == 0 && (input / i) < 999 
            return true
        end
    end
    return false
end

until is_pal?(start) && facts_to_2_3s(start)
    start -= 1
end

p start
# 906609
