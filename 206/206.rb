# Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.

# Find the unique positive integer whose square has the form 1, _2_, 3_4, _5_, 6_7, _8_, 9_0

def matches(x)
  (x * x).to_s[/1.2.3.4.5.6.7.8.9.0/]
end

x = Math.sqrt(1020304050607080900).floor + 1


puts x

until matches(x)
  foo = x * x
  # puts foo
  # next x += 1 if foo % 10 > 0
  # next x += 10 if foo % 1_000 <= 900
  # next x += 100 if foo % 100_000 > 80_000


  if foo % 10 == 0
    x += 10
  else
    x += 1
  end

  # break if matches(x)

  # x += 100 if foo % 100_000 > 80000
  #
  # break if foo > 1930000000000000000
end

puts x

puts 'wrong!' unless x == 1389019170
puts 'correct!' if x == 1389019170

# puts x * x
# 1929374254627488900
# is the square



# 1389019170

# 1,389,019,170

# (15 seconds)


# 1_010_101_010
