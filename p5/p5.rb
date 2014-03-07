# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?


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

# 232_792_560


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