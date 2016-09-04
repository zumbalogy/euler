-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143?

lpf a b = if a < b * b
          then a
          else if (div a b) * b == a
               then lpf (div a b) b
               else lpf a (b + 1)

main = putStrLn (show (lpf 600851475143 2))
-- 6857
