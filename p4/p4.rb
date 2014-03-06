# look for the largest palindome number (9009) that
# is the product of 2 3-diget numbers.

output = 0

(100..999).each do |foo|      # can start at 101 and step 2 for odds
    (100..999).each do |bar|  # for both these, not the general case though
        foobar = foo * bar    # though oddness is likely due to probably starting/ending in 9
        if foobar > output && foobar.to_s.reverse == foobar.to_s
            output = foobar
        end
    end
end


puts output
# 906609
# 913 * 993