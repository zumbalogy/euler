# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

###########################################################

def gcd(a, b)
    b == 0 ? a : gcd(b, a % b)
end

def lcm(a, b)
    (a * b) / gcd(a, b)
end

p (11..20).reduce &:lcm


#############################################################

require 'benchmark'


# 232_792_560

Benchmark.bmbm do |bm|
    bm.report('best, with &method') do
        (11..20).reduce &method(:lcm)
    end
    bm.report('dumb checking') do
        start = 0
        divisible = false

        until divisible == true
            start += 2520 #iterating by this works, but is kinda cheating
            if start % 380 == 0 &&  #these are some eyeballed lcms for 20-10
                start % 323 == 0 &&
                start % 143 == 0 &&
                start % 63 == 0 &&
                start % 60 == 0 &&
                start % 16 == 0 &&
                start % 12 == 0
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
        (11..19).each do |i|
            total = total.lcm(i) 
        end
    end
    bm.report('bunch of lcms') do
        20.lcm(19.lcm(18.lcm(17.lcm(16.lcm(15.lcm(14.lcm(13.lcm(12.lcm(11)))))))))
    end
end

###################################################

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

p start


####################################################################

def gcd(a, b)
    b == 0 ? a : gcd(b, a % b)
end

def lcm(a, b)
    (a * b) / gcd(a, b)
end

def recursive(a, b=a-1, c=a/2)
        b > c ? recursive(lcm(a,b), b-1, c) : a
end

puts recursive(20)

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


#####################################################
total = 20
(11..19).each do |i|
    total = total.lcm(i) 
end

p total

###################################################

puts 20.lcm(19.lcm(18.lcm(17.lcm(16.lcm(15.lcm(14.lcm(13.lcm(12.lcm(11)))))))))

# Rehearsal --------------------------------------------------------------
# dumb checking                0.010000   0.000000   0.010000 (  0.008814)
# eulid own fuctions           0.000000   0.000000   0.000000 (  0.000019)
# eulid ruby built in          0.000000   0.000000   0.000000 (  0.000019)
# non recursive function       0.000000   0.000000   0.000000 (  0.000015)
# non recursive non function   0.000000   0.000000   0.000000 (  0.000008)
# bunch of lcms                0.000000   0.000000   0.000000 (  0.000006)
# ----------------------------------------------------- total: 0.010000sec

#                                  user     system      total        real
# dumb checking                0.010000   0.000000   0.010000 (  0.008741)
# eulid own fuctions           0.000000   0.000000   0.000000 (  0.000031)
# eulid ruby built in          0.000000   0.000000   0.000000 (  0.000017)
# non recursive function       0.000000   0.000000   0.000000 (  0.000020)
# non recursive non function   0.000000   0.000000   0.000000 (  0.000012)
# bunch of lcms                0.000000   0.000000   0.000000 (  0.000009)


