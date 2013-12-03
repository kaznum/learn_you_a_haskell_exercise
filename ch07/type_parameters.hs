-- data Maybe a = Nothing | Just a

-- *Main> :t Just 3
-- Just 3 :: Num a => Maybe a
-- *Main> Just 3 :: Maybe Int
-- Just 3

-- *Main> Just "Haha"
-- Just "Haha"
-- *Main> Just 84
-- Just 84
-- *Main> :t Just "Haha"
-- Just "Haha" :: Maybe [Char]
-- *Main> :t Just 84
-- Just 84 :: Num a => Maybe a
-- *Main> :t Nothing
-- Nothing :: Maybe a
-- *Main> Just 10 :: Maybe Double
-- Just 10.0

data Shape = Sphere Float Float Float | Rectangle Float Float Float Float deriving (Show)

data IntMaybe = INothing | IJust Int deriving (Show)
data StringMaybe = SNothing | SJust String
data ShapeMaybe = ShNothing | ShJust Shape

-- *Main> IJust 3
-- IJust 3
-- *Main> INothing
-- INothing
-- *Main> :t INothing 
-- INothing :: IntMaybe
-- *Main> :t IJust 3
-- IJust 3 :: IntMaybe

--- Should We Parameterize Our Car?



-- to be continued
