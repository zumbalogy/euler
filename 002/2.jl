# Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

# Sum the even terms in the Fibonacci sequence under four million

function sum_even_fibs_to(limit)
  total = 0
  a = 1
  b = 2
  while b < limit
    total += b
    c = a + b
    a = b + c
    b = a + c
  end
  total
end

println(sum_even_fibs_to(4000000))
# 4613732
