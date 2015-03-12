# Find the largest palindome number (9009) that is the product of 2 3-digit numbers.

def to_pal(input)
  (input.to_s + input.to_s.reverse).to_i
end

def product_of_2_3s(input)
  (100..999).each do |i|
    return true if input % i == 0 && (input / i) < 999
  end
  false
end

def large_pal
  n = 999
  n -= 1 until product_of_2_3s(to_pal(n))
  to_pal(n)
end

puts large_pal
# 906609
# 913 * 993
