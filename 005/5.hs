-- 2520 is the smallest number that can be divided by the numbers from 1 to 10 without any remainder.

-- What is the smallest positive number that is evenly divisible by the numbers from 1 to 20?

main = putStrLn (show (foldl lcm 11 [12..20]))
-- 232792560
