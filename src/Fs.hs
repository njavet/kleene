inc1 :: Integer -> Integer
inc1 n = n + 1

inc2 :: Integer -> Integer
inc2 = \n -> n + 1

two :: Integer
two = inc1 1

someGreeting :: String -> String
someGreeting person = "Hello " ++ person

square :: Integer -> Integer
square x = x*x

squareLambda :: Integer -> Integer
squareLambda = \x -> x*x

addTupled :: (Integer, Integer) -> Integer
addTupled (x, y) = x + y

avg3Tupled :: (Float, Float, Float) -> Float
avg3Tupled ( x, y, z ) = (x + y + z) / 3

four :: Float
four = avg3Tupled ( 3, 4, 5 )
{- A Curried Function
    'add' is the parametrized (a.k.a curried) version of
    `add`. It is a function that returns a (unary) function.
    Note that the following three lines are equivalent
    declarations:

    'add = \x -> \y -> x + y'
    'add x = \y -> x + y'
    'add x y = x + y'

    Also note that the parenthesis are not needed in the 
    declaration of the type of 'add'.
-}
add :: Int -> (Int -> Int)
add n m = n + m

{- Partial Application
    'add3' is the function that adds '3' to any given input.
    Thanks to currying, we can realize 'add3' as a special
    case of 'add'. Thanks to partial application, this 
    corresponds to a single function call.
-}
add3 :: Int -> Int
add3 = add 3

{- Exercise
    Declare a curried version of the function 'avg3Tupled'
    as a lambda term.
-}
avg3 :: Float -> Float -> Float -> Float
avg3 = \x -> \y -> \z -> (x + y + z) / 3

{- Exercise
    use the binary function '(++)' that concatenates strings
    to specify a function that prepends "=> " to any given
    input string. Use partial application
-}
prepArrow :: String -> String
prepArrow = (++) "=> "

{- Function as Input
    'apply' is a function that accepts a function as input
    (and applies it to the remaining input)
-}
apply :: (a -> b) -> a -> b
apply f x = f x

{- Function as Input and Output
    'twice' is a function that accepts and returns a 
    function.
-}
twice :: (a -> a) -> (a -> a)
twice f x = f (f x)
-- twice f = f . f -- Alternatively use this syntax

{- Exercise
    Write a function `thrice` that applies a function three
    times.
-}
thrice :: (a -> a) -> a -> a
thrice f x = f (f (f x))

thrice2 :: (a -> a) -> a -> a
thrice2 f = f . f . f
{- Exercise
    Write a function 'compose' that accepts two functions
    and applies them to a given argument in order.
-}
compose :: (a -> b) -> (b -> c) -> a -> c
compose f g x = g (f x)

{- Exercise
    reimplement 'twice' and 'thrice' with as an application
    of the function 'compose'.
-}
twiceByComp :: (a -> a) -> a -> a
twiceByComp f = compose f f

thriceByComp :: (a -> a) -> a -> a
thriceByComp f = f . (compose f f)

{- List map 
    A often used higher function is ``mapping'' of lists.
    This function will apply a function (given as an 
    argument) to every element in a list (also given as an
    argument) and return a new list containig the changed 
    values. There are a lot of other functions to work
    with lists (and similar types). We will learn about 
    these functions later.
-}
mapping :: [Integer]
mapping = map (\n -> n + 1) [1, 2, 3]

{-| Exercise
    greet all friends using 'friends', 'map' and
    'greeting'. 
-}
friends :: [String]
friends =
    [ "Peter"
    , "Nina"
    , "Janosh"
    , "Reto"
    , "Adal"
    , "Sara"
    ]

greeting :: String -> String
greeting person = "Hello " ++ person

greetFriends :: [String]
greetFriends = map greeting friends

