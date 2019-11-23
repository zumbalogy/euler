# Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.

x = Math.sqrt(1020304050607080900).floor # is a multple of 10

x += 10 until (x * x).to_s[/1.2.3.4.5.6.7.8.9.0/]

puts x
# 1389019170
