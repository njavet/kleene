

isPrime :: Integer -> Bool
isPrime n
  | n < 2     = False
  | n == 2    = True
  | otherwise = all (\d -> mod n d /= 0) [2..n-1]
