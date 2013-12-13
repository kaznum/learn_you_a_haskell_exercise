--- Inside the Eq Type Class

--- A Traffic Light Data Type
data TrafficLight = Red | Yellow | Green
instance Eq TrafficLight where
  Red == Red = True
  Green == Green = True
  Yellow == Yellow = True
  _ == _ = False

instance Show TrafficLight where
  show Red = "Red light"
  show Yellow = "Yellow light"
  show Green = "Green light"

-- *Main> Red == Red
-- True
-- *Main> Red == Yellow
-- False
-- *Main> Red `elem` [Red, Yellow, Green]
-- True
-- *Main> [Red, Yellow, Green]
-- [Red light,Yellow light,Green light]

--- Subclassing

--- Parameterized Types As Instances of Type Classes
-- *Main> :info Num
-- class Num a where
--   (+) :: a -> a -> a
--   (*) :: a -> a -> a
--   (-) :: a -> a -> a
--   negate :: a -> a
--   abs :: a -> a
--   signum :: a -> a
--   fromInteger :: Integer -> a
--   	-- Defined in `GHC.Num'
-- instance Num Integer -- Defined in `GHC.Num'
-- instance Num Int -- Defined in `GHC.Num'
-- instance Num Float -- Defined in `GHC.Float'
-- instance Num Double -- Defined in `GHC.Float'
-- *Main> :info Maybe
-- data Maybe a = Nothing | Just a 	-- Defined in `Data.Maybe'
-- instance Eq a => Eq (Maybe a) -- Defined in `Data.Maybe'
-- instance Monad Maybe -- Defined in `Data.Maybe'
-- instance Functor Maybe -- Defined in `Data.Maybe'
-- instance Ord a => Ord (Maybe a) -- Defined in `Data.Maybe'
-- instance Read a => Read (Maybe a) -- Defined in `GHC.Read'
-- instance Show a => Show (Maybe a) -- Defined in `GHC.Show'

