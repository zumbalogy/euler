-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143?

factor 1 = 1
factor x = let z = [div x y | y <- [2..x], (div x y) * y == x]
           in if (null z) then 1 else (head z)

factors n = takeWhile (\x -> x /= 1) [x | x <- (iterate factor n)]
topFactor n = last (factors n)

main = putStrLn (show (topFactor 600851475143))
-- 6857
