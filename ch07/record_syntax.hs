data Person' = Person' String String Int Float String String deriving (Show)
-- Firstname, Lastname, age, height, phone, favorite ice cream flavor

-- *Main> let guy = Person' "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"
-- *Main> guy
-- Person' "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"

firstName' :: Person' -> String
firstName' (Person' firstName _ _ _ _ _) = firstName

lastName' :: Person' -> String
lastName' (Person' _ lastName _ _ _ _) = lastName

age' :: Person' -> Int
age' (Person' _ _ age _ _ _) = age

height' :: Person' -> Float
height' (Person' _ _ _ height _ _) = height

phoneNumber' :: Person' -> String
phoneNumber' (Person' _ _ _ _ number _) = number

flavor' :: Person' -> String
flavor' (Person' _ _ _ _ _ flavor) = flavor

-- *Main> let guy = Person' "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"
-- *Main> firstName guy
-- "Buddy"
-- *Main> height guy
-- 184.2
-- *Main> flavor guy
-- "Chocolate"

data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     , flavor :: String } deriving (Show)

-- *Main> :t flavor
-- flavor :: Person -> String
-- *Main> :t firstName
-- firstName :: Person -> String

data Car' = Car' String String Int deriving (Show)
-- *Main> Car' "Ford" "Mustang" 1967
-- Car' "Ford" "Mustang" 1967

data Car = Car { company :: String
               , model :: String
               , year :: Int
               } deriving (Show)

-- *Main> Car { company="Ford", model="Mustang", year=1967 }
-- Car {company = "Ford", model = "Mustang", year = 1967}

