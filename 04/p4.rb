# Find the largest palindome number (9009) that is the product of 2 3-digit numbers.

def to_pal(n)
  (n.to_s + n.to_s.reverse).to_i
end

def product_of_2_3s(n)
  (100..999).each do |i|
    return true if n % i == 0 && (n / i) < 999
  end
  false
end

def large_pal
  i = 999
  i -= 1 until product_of_2_3s(to_pal(i))
  to_pal(i)
end

puts large_pal
# 906609
# 913 * 993
