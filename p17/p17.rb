# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

one_nine = 'onetwothreefourfivesixseveneightnine'.length

ten_nineteen = 'teneleventwelvethirfourfifsixseveneightnine'.length + ('teen'.length * 7)

twenty_ninty = 'twenthirfourfifsixseveneighnine'.length + ('ty'.length * 8)

sum_99 = one_nine + ten_nineteen + twenty_ninty + (one_nine * 8)

hundreds = one_nine + ('hundred'.length * 9) + ('and'.length * 8)

sum_999 = hundreds + (sum_99 * 10)

one_thousand = 'onethousand'.length

total = sum_999 + one_thousand

puts total
# 4554
