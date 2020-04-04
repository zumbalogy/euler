# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

one_nine = 'onetwothreefourfivesixseveneightnine'.length
# 36

ten_nineteen = 'teneleventwelvethirfourfifsixseveneightnine'.length + ('teen'.length * 7)
# 71

twenty_ninty = 'twenthirfourfifsixseveneighnine'.length + ('ty'.length * 8)
# 47

sum_99 = (one_nine * 9 ) + ten_nineteen + twenty_ninty + (one_nine * 8)
# 730

####################################################

hundred = one_nine + ('hundred'.length * 9)
# 99

hundred_and = (one_nine * 99) + ('hundredand'.length * 9 * 99)
# 12474

hundreds = hundred + hundred_and
# 12573

####################################################

sum_999 = hundreds + (sum_99 * 10)
# 19873
    
one_thousand = 'onethousand'.length
# 11

total = sum_999 + one_thousand

puts total
# 19_884

