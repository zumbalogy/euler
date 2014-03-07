# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

require 'benchmark'

Benchmark.bmbm do |bm|
    bm.report('dumb checking') do
        start = 0
        divisible = false

        until divisible == true
            start += 2520  
            if start % 380 == 0 &&
                start % 323 == 0 &&
                start % 143 == 0 &&
                start % 63 == 0 &&
                start % 60 == 0 &&
                start % 16 == 0 &&
                start % 12 == 0 # 5 3 2 
                divisible = true
            end
        end
    end

    bm.report('eulid own fuctions') do
        def gcd(a, b)
            b == 0 ? a : gcd(b, a % b)
        end

        def lcm(a, b)
            (a * b) / gcd(a, b)
        end

        def recursive(a, b=a-1, c=a/2)
                b > c ? recursive(lcm(a,b), b-1, c) : a
        end

        recursive(20)
    end

    bm.report('eulid ruby built in') do
        def recursive(a, b=a-1, c=a/2)
            b > c ? recursive(a.lcm(b), b-1, c) : a
        end
        recursive(20)
    end

    bm.report('non recursive function') do
        def nonrecursive(a)
            total = a
            (a/2..a).each do |i|
                total = total.lcm(i) 
            end
            total
        end
        nonrecursive(20)
    end
    bm.report('non recursive non function') do
        total = 20
        (10..20).each do |i|
            total = total.lcm(i) 
        end
    end
end

# start = 0
# divisible = false

# until divisible == true
#     start += 2520  
#     if start % 380 == 0 &&
#         start % 323 == 0 &&
#         start % 143 == 0 &&
#         start % 63 == 0 &&
#         start % 60 == 0 &&
#         start % 16 == 0 &&
#         start % 12 == 0 # 5 3 2 
#         divisible = true
#     end
# end

# p start

# 232_792_560

####################################################################

# def gcd(a, b)
#     b == 0 ? a : gcd(b, a % b)
# end

# def lcm(a, b)
#     (a * b) / gcd(a, b)
# end

# def recursive(a, b=a-1, c=a/2)
#         b > c ? recursive(lcm(a,b), b-1, c) : a
# end

# puts recursive(20)

#################################################################

def recursive(a, b=a-1, c=a/2)
    b > c ? recursive(a.lcm(b), b-1, c) : a
end

puts recursive(20)

######################################

def nonrecursive(a)
    total = a
    (a/2..a).each do |i|
        total = total.lcm(i) 
    end
    total
end

puts nonrecursive(20)