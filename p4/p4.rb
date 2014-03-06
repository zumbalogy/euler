# look for the largest palindome number (9009) that
# is the product of 2 3-diget numbers.

output = 0

(100..999).each do |foo|
    (100..999).each do |bar|
        foobar = foo * bar
        if foobar > output && foobar.to_s.reverse == foobar.to_s
            output = foobar
        end
    end
end

puts output
# 906609
