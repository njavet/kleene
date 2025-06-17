import Data.List (sort)


flatSort :: [[Integer]] -> [Integer]
flatSort xs = concat (map sort xs)

flatSort2 :: [[Integer]] -> [Integer]
flatSort2 [] = []
flatSort2 (x:xs) = sort x ++ flatSort xs

initial :: String -> String -> Bool
initial [] xs                     = False
initial xs []                     = False
initial (x:xs) (y:ys) | x == y    = True
                      | otherwise = initial xs ys


substring :: String -> String -> Bool

