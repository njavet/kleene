data LiftingSet = LifitingSet
    { weight   :: Double
    , reps     :: Double
    , breakSec :: Double
    } deriving (Show, Eq)

data Exercise = Exercise
    { name :: String
    , sets :: [LiftingSet]
    } deriving (Show, Eq)
