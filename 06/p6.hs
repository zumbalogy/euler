-- The sum of the squares of the first 10 natural numbers is
-- 1^2 + 2^2 + ... + 10^2 = 385

-- The square of the sum of the first 10 natural numbers is
-- (1 + 2 + ... + 10)^2 = 55^2 = 3025

-- The delta for the sum of the squares of the first 10 natural numbers
-- and the square of the sum is 3025 − 385 = 2640

-- Find delta for the sum of squares of the first 100 natural numbers and square of the sum.

sumRange x = (x / 2) * (x + 1)

delta = (sumRange 100) ^ 2 - (sum $ map (^2) [1..100])

main = putStrLn $ show delta
-- 2.516415e7
