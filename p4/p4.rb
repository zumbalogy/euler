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
        return true if input % i == 0 && (input / i) < 999
    end
    return false
end

start -= 1 until is_pal?(start) && facts_to_2_3s(start)

p start
# 906609

###############################################

# cycle down through palindromes
# could start smarter, but thats kinda cheating
# could decriment start more intelligenlty maybe?

start = 999

start -= 1 until facts_to_2_3s((start.to_s + start.to_s.reverse).to_i)

p (start.to_s + start.to_s.reverse).to_i
# 906609


#####################################################

require 'benchmark'

Benchmark.bmbm do |bm|
    bm.report('loop in loop') do
        100.times do
            output = 0
            (100..999).each do |foo|
                (foo..999).each do |bar|
                    foobar = foo * bar
                    if foobar > output && foobar.to_s.reverse.to_i == foobar
                        output = foobar
                    end
                end
            end
        end
    end
    bm.report('step down till hit palindromes') do
        100.times do
            start = 999 * 999
            start -= 1 until is_pal?(start) && facts_to_2_3s(start)
        end
    end
    bm.report('step through palindromes') do
        100.times do
            start = 999
            start -= 1 until facts_to_2_3s((start.to_s + start.to_s.reverse).to_i)
        end
    end
end

# Rehearsal ------------------------------------------------------------------
# loop in loop                     5.020000   0.010000   5.030000 (  5.033292)
# step down till hit palindromes   4.090000   0.000000   4.090000 (  4.095871)
# step through palindromes         0.620000   0.000000   0.620000 (  0.624361)
# snebel                          10.240000   0.010000  10.250000 ( 10.259221)
# -------------------------------------------------------- total: 19.990000sec

#                                      user     system      total        real
# loop in loop                     5.020000   0.010000   5.030000 (  5.030282)
# step down till hit palindromes   4.080000   0.000000   4.080000 (  4.094746)
# step through palindromes         0.620000   0.000000   0.620000 (  0.621729)
# snebel                          10.230000   0.010000  10.240000 ( 10.253183)
