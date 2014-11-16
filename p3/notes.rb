# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

require 'prime'

def divisors input
    count = 1
    sq = Math.sqrt input
    until count > sq
        output = count if input % count == 0 && Prime.prime?(count)
        count += 1
    end
    output
end

p divisors(600851475143)

# 6857

##########################################

require 'benchmark'

Benchmark.bmbm do |bm|
    bm.report('main') do
        count = Math.sqrt(600851475143).to_i - 1
        until 600851475143 % count == 0 && Prime.prime?(count)
            count -= 2
        end
    end
    # bm.report('prime.new') do
    #     count = Prime.new
    #     until count * count > 600851475143
    #         if 600851475143 % count == 0
    #             output = count
    #         end
    #     count.previous
    #     end
    # end
    bm.report('prime division flatten') do
        Prime.prime_division(600851475143).flatten.max
    end
    bm.report('prime division -1[0]') do
        Prime.prime_division(600851475143)[-1][0]
    end
    bm.report('prime division max[0]') do
        Prime.prime_division(600851475143).max[0]
    end
    bm.report('prime division last[0]') do
        Prime.prime_division(600851475143).last[0]
    end
    bm.report('prime division -1') do
        Prime.prime_division(600851475143)[-1]
    end
    bm.report('prime sqrt') do
        count = Math.sqrt(600851475143).to_i
        until 600851475143 % count == 0 && Prime.prime?(count)
            count -= 1
        end
    end
    bm.report('only sqrt') do
        Math.sqrt(600851475143).to_i
    end
end


foo = Math.sqrt(600851475143)
Prime.each do |b|
    break if b > foo
    p b if 600851475143 % b == 0
end
