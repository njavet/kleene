{- a multiline comment
   {- can be nested -}
{- Optional "title" of the comment
    Content of the comment possibly spaning multiple lines
    with length <= 60.
-}
-}

five :: Integer
five = 5

seven :: Integer
seven = five + 2

twentyFour :: Float
twentyFour = 3 * 2 ^ 3

intSevenByThree :: Integer
intSevenByThree = seven `div` 3

sevenByThree :: Integer
sevenByThree = div seven 3

floatSevenByThree :: Float
floatSevenByThree = 7 / 3

true :: Bool
true = True

false :: Bool
false = False

alsoTrue :: Bool
alsoTrue = true || false

alsoFalse :: Bool
alsoFalse = true && false

moreTruth :: Bool
moreTruth = not alsoFalse

aChar :: Char
aChar = 'a'

aString :: String
aString = "Happy new year"

greeting :: String
greeting = aString ++ " " ++ "2022"

greeting2 :: String
greeting2 = concat
    [ aString
    , " "
    , "2022"
    ]

aListOfStrings :: [String]
aListOfStrings = [ "one", "two", "three" ]

aListOfInts :: [Integer]
aListOfInts = [ 1, 2, 3 ]

friendGroups :: [[String]]
friendGroups =
      [ ["Peter", "Anna", "Roman", "Laura"]
      , ["Anna","Reto"]
      , ["Christoph", "Mara", "Andrew"]
      ]

someInts :: [Integer]
someInts = [1..15] -- range

someEvens :: [Integer]
someEvens = [ 2*x | x <- [-5..5]]

pairs :: [(Integer, Bool)]
pairs = [ (x,y) | x <- [0..5], y <- [True, False]]

lessThanPairs :: [(Integer,Integer)]
lessThanPairs = [ (x,y)
                  | x <- [0..5]
                  , y <- [0..5]
                  , x < y -- guard
                  , x > 1 -- second guard
                  ]

squares :: [Integer]
squares = [x^2 | x <- [1..100]]

oddSquares :: [Integer]
oddSquares = [x | x <- squares, not (even x)]

