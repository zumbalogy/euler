# Find the largest palindome number (9009) that
# is the product of 2 3-digit numbers.

def to_pal(n)
  (n.to_s + n.to_s.reverse).to_i
end

def pal_product?(n)
  (100..999).any? do |i|
    (n % i == 0) && (n / i) < 999
  end
end

range = (1..999).reverse_each
match = range.find { |i| pal_product?(to_pal(i)) }
large_pal = to_pal(match)

puts large_pal
# 906609
# 913 * 993
