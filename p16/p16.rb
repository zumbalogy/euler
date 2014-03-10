# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 2^1000?


puts (2 ** 1_000).to_s.split('').map {|i| i.to_i}.reduce(:+)


puts (2 ** 1_000).to_s.split('').inject(0) {|result, elem| result + elem.to_i}


# 1366
