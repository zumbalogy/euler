# Find the largest palindome number (9009) that is the product of 2 3-digit numbers.

to_pal(n) = int("$n$(reverse("$n"))")

function product_of_2_3s(n)
  for i = 100:999
    if n % i == 0 && n / i < 999
      return true
    end
  end
  false
end

function large_pal()
  i = 999
  while !product_of_2_3s(to_pal(i))
    i -= 1
  end
  to_pal(i)
end

println(large_pal())
# 906609
# 913 * 993
