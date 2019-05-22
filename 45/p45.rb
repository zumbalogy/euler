# Triangle, pentagonal, and hexagonal numbers are generated by the following formulae:

# Triangle	 	Tn=n(n+1)/2	 	1, 3, 6,  10, 15, ...
# Pentagonal	Pn=n(3n−1)/2	1, 5, 12, 22, 35, ...
# Hexagonal	 	Hn=n(2n−1)	 	1, 6, 15, 28, 45, ...
# It can be verified that T285 = P165 = H143 = 40755.

# Find the next triangle number that is also pentagonal and hexagonal.

tris = (0..).lazy.map { |n| n * (    n + 1) / 2 }
pens = (0..).lazy.map { |n| n * (3 * n - 1) / 2 }
hexs = (0..).lazy.map { |n| n * (2 * n - 1)     }

t = tris.peek
p = pens.peek
h = hexs.peek

until h > 40755 && p == h && t == h
  next t = tris.next if t < p
  next p = pens.next if p < h
  h = hexs.next
end

puts h
# 1533776805
