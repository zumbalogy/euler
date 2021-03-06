# Find the largest palindome number (9009) that
# is the product of 2 3-digit numbers.

def to_pal(n)
  (n.to_s + n.to_s.reverse).to_i
end

def valid_prods?(n)
  (100..1000).any? do |i|
    (n % i == 0) && (n / i) < 1000
  end
end

range = (1..1000).reverse_each
match = range.find { |i| valid_prods?(to_pal(i)) }
large_pal = to_pal(match)

puts large_pal
# 906609
# 913 * 993

# note, this may have bug not finding numbers like 12321
