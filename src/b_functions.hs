{- Contents
    A short integerroduction to Haskell;
    On how to create simple functions.
-}

-----------------------------------------------------------
-- Elementary Functions
-----------------------------------------------------------

{- General Syntax for functions
    * Input on the left, output on the right.
    * Functions also have a type: input type on the left
      side, output type on the right side, arrow inbetween.
-}
inc1 :: Integer -> Integer
inc1 n = n + 1

{- Lambda notation
    Everything can also be written on the right side (lambda
    notation). In fact, `inc1` is just syntactic sugar for
    `inc2`.
-}
inc2 :: Integer -> Integer
inc2 = \n -> n + 1

{- Function application
    To apply a function, write the function to the left of
    the input/argument (no brackets needed).
-}
two :: Integer
two = inc1 1

someGreeting :: String -> String
someGreeting person = "Hello " ++ person


{- Exercise
    Define a function `square`, that squares the given input
    and write down its type. Define the same function using
    the lambda notation.
-}
square :: Integer -> Integer
square x = error "fixme"

squareLambda :: Integer -> Integer
squareLambda = error "fixme"


-----------------------------------------------------------
-- Functions of Several Variables
-----------------------------------------------------------

{- Tupled Inputs
    'addTupled' is binary function, its output depends on 
    two separate integers.
-}
addTupled :: (Integer, Integer) -> Integer
addTupled (x, y) = x + y

{- 
    'avg3Tupled' is a function that depends on three input
    variables.
-}
avg3Tupled :: (Float, Float, Float) -> Float
avg3Tupled ( x, y, z ) = (x + y + z) / 3

{- Evaluating with Tuples
    We evaluate a function of several variables by providing
    values *for each* input variabele.
-}
four :: Float
four = avg3Tupled ( 3, 4, 5 )

{- 
    If we want to evaluate a multivariable function before
    we have all inputs ready, we have to properly
    parametrize it. We can do this with curried functions.
    More on that later!
-}


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
avg3 = error "fixme"

{- Exercise
    use the binary function '(++)' that concatenates strings
    to specify a function that prepends "=> " to any given
    input string. Use partial application
-}
prepArrow :: String -> String
prepArrow = error "fixme"

-- When calling this
-- > prepArrow "foo"
-- It should output the following
-- '=> foo'


-----------------------------------------------------------
-- Higher Order Functions
-----------------------------------------------------------

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
thrice f x = error "fixme"

{- Exercise
    Write a function 'compose' that accepts two functions
    and applies them to a given argument in order.
-}
compose :: (a -> b) -> (b -> c) -> a -> c
compose f g x = error "fixme"

{- Exercise
    reimplement 'twice' and 'thrice' with as an application
    of the function 'compose'.
-}
twiceByComp :: (a -> a) -> a -> a
twiceByComp f = error "fixme"

thriceByComp :: (a -> a) -> a -> a
thriceByComp f = error "fixme"

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
greetFriends = error "fixme"

