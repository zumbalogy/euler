# Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

start = [0, 1]
total = 0
until start.last >= 4_000_000
  start << start[-1] + start[-2]
  total += start.last if start.last.even?
  start.shift
end

p total

# 4613732
# 1.8282e-05 seconds

##############################################

first = 0
second = 1
total = 0

until second >= 4_000_000
  next_fib = first + second
  total += next_fib if next_fib.even?
  first = second
  second = next_fib
end

p total

##############################################

a = 1
b = 2
total = 0

while b < 4_000_000
  total += b

  save = b
  b += a
  a = save

  save = b
  b += a
  a = save

  save = b
  b += a
  a = save
end

p total

# 4_613_732

#old time with chekcing if even
# 5.219e-06

# new time (with loop)
# 1.1328e-05

# new time without loop (not DRY)
# 4.246e-06

#################################################

a = 1
b = 2
total = 0

def inc_fib3(a, b)
  [a + b + b, a + a + b + b + b]
end

while b < 4_000_000
  total += b
  a, b = inc_fib3(a, b)
end

p total
# 4613732

#######################################

a = 1
b = 2
total = 0

def inc_fib((a, b))
  [b, a + b]
end

while b < 4_000_000
  total += b
  a, b = ([:inc_fib] * 3).reduce([a, b]) { |c, d| send(d, c)}
end

p total
# 4613732


##########################

a = 1
b = 2
total = 0

def inc_fib(a, b)
  [b, a + b]
end

while b < 4_000_000
  total += b
  a, b = inc_fib(a, b)
  a, b = inc_fib(a, b)
  a, b = inc_fib(a, b)
end

p total
# 4613732





