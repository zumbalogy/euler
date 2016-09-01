-- The natural numbers below 10 that are multiples of 3 or 5 are 3, 5, 6 and 9.
-- The sum of these multiples is 23.
-- Find the sum of all the multiples of 3 or 5 below 1000.

total = sum [x | x <- [1..999], or [(mod x 5 == 0), (mod x 3 == 0)]]

main = putStrLn (show total)
-- 233168
