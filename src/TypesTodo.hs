-----------------------------------------------------------
-- Referential transparency
-----------------------------------------------------------

{- Referential Transparency
    It is always possible to exchange an expression with
    its definition.
-}
myThree :: Integer
myThree = if True then 3 else 4

myNumber :: Integer
myNumber = myThree + 7

anotherWayToPutIt =
    (if True then 3 else 4) + 7
--  ^--this is 'myThree'--^

{- Imperative Code
    Imperative Code is not usually referrentially
    transparent.

    x = 3;
    x = x + 1;
    print x + 4

    vs

    x = 3;
    x = x + 1;
    print 3 + 4

-}

-----------------------------------------------------------
-- Sum Types
-----------------------------------------------------------

-- Playing Cards

-- King, Queen, etc.
data Face
    = FaceFixme

-- Heart, Spade, etc.
data Suit
    = SuitFixme

-- A card consists of a face and a suit
data Card = CardFixMe

-- A hand holds multiple cards
type Hand = [Card]


{- Exercise
    Write a function 'evalCard' that returns all possible
    values of a single card as follows:
    * A card with a number has the value of the number
    * An Ace has two possible values: 1 and 11
    * All other cards are valued 10.
-}
evalCard :: Card -> [Int]
evalCard c = error "fixme"


{- Exercise
    Write a function 'evalHand' that returns all possible
    values of a hand (use foldl). Dublicates are OK.
-}
evalHand :: Hand -> [Int]
evalHand = foldl f [0]
    where
        f vals c = error "fixme"


{- Exercise
    Specify two hands:
    hand1 = 🂡,🂥,🃓,🃞
    hand2 = 🃍,🃁,🂡,🂪,🂧
-}

hand1 :: Hand
hand1 = error "fixme"

hand2 :: Hand
hand2 = error "fixme"

{- Exercise
    Test 'evalHand' with 'hand1' and 'hand2' using the repl.
-}

-- Shapes

-- A shape is either a rectangle, a square, or a circle
data Shape
    = Rectangle Float Float
    | Square Float
    | Circle Float
    deriving (Show, Eq)

-- Calculates the area of a shape
area :: Shape -> Float
area (Rectangle a b) = a * b
area (Square a) = a * a
area (Circle r) = pi * r * r

{- Exercise
    Write a function to calculate the circumference of a shape.
    Use the 'case .. of' syntax for pattern matching.
-}
circ :: Shape -> Float
circ shape = error "fixme"

-----------------------------------------------------------
-- Typeclasses
-----------------------------------------------------------

{- Monoid
   There is a typeclass called Monoid that features
   1. One special (neutral) element 'e'
   2. A binary operation 'op'
   Moreover, there are rules:
   1. e `op` x = x `op` e = x, for all x
   2. (x `op` y) `op`z = x `op` (y `op`z) for all x,y,z

   **Note**
   The "official" names in Haskell for 'e' and 'op' are
   'mempty' and 'mconcat'.
-}
class MyMonoid a where
    e :: a
    op :: a -> a -> a

instance MyMonoid Int where
    e = 0
    op = (+)

{- Exercise
    Write a Monoid instance for [a] that satisfies the rules.
-}

instance MyMonoid [a] where
    e = error "fixme"
    op = error "fxme"