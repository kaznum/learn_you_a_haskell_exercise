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

data Car = Car { company :: String
               , model :: String
               , year :: Int
               } deriving (Show)

data Car' a b c = Car' { company' :: a
                       , model' :: b
                       , year' :: c
                       } deriving (Show)

tellCar :: Car -> String
tellCar (Car {company = c, model = m, year = y}) =
        "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

-- *Main> let stang = Car {company="Ford", model="Mustang", year=1967}
-- *Main> tellCar stang
-- "This Ford Mustang was made in 1967"

tellCar' :: (Show a) => Car' String String a -> String
tellCar' (Car' {company' = c, model' = m, year' = y}) =
         "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

-- *Main> tellCar' (Car' "Ford" "Mustang" 1967)
-- "This Ford Mustang was made in 1967"
-- *Main> tellCar' (Car' "Ford" "Mustang" "nineteen sixty seven")
-- "This Ford Mustang was made in \"nineteen sixty seven\""
-- *Main> :t Car' "Ford" "Mustang" 1967
-- Car' "Ford" "Mustang" 1967 :: Num c => Car' [Char] [Char] c
-- *Main> :t Car' "Ford" "Mustang" "nineteen sixty seven"
-- Car' "Ford" "Mustang" "nineteen sixty seven"
--   :: Car' [Char] [Char] [Char]

--- Vector von Doom
data Vector a = Vector a a a deriving (Show)

vplus :: (Num a) => Vector a -> Vector a -> Vector a
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)

dotProd :: (Num a) => Vector a -> Vector a -> a
(Vector i j k) `dotProd` (Vector l m n) = i*l + j*m + k*n

vmult :: (Num a) => Vector a -> a -> Vector a
(Vector i j k) `vmult` m = Vector (i*m) (j*m) (k*m)

-- *Main> Vector 3 5 8 `vplus` Vector 9 2 8
-- Vector 12 7 16
-- *Main> Vector 3 5 8 `vplus` Vector 9 2 8 `vplus` Vector 0 2 3
-- Vector 12 9 19
-- *Main> Vector 3 9 7 `vmult` 10
-- Vector 30 90 70
-- *Main> Vector 4 9 5 `dotProd` Vector 9.0 2.0 4.0
-- 74.0
-- *Main> Vector 2 9 3 `vmult` (Vector 4 9 5 `dotProd` Vector 9 2 4)
-- Vector 148 666 222

--- an error occurs by the followings
--- Vector (3 :: Double) (3 :: Double) (3 :: Double) `vplus` Vector (3 :: Integer) (3 :: Integer) (3 :: Integer)