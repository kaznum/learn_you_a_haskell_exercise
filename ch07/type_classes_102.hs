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

-- to be continued