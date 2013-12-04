--- Equating People
data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int } deriving (Eq)
mikeD = Person { firstName = "Michael", lastName = "Diamond", age = 43 }
adRock = Person { firstName = "Adam", lastName = "Horovitz", age = 41 }
mca = Person { firstName = "Adam", lastName = "Yauch", age = 44 }

-- mca == adRock
-- mikeD == adRock
-- mikeD == mikeD
-- mikeD == Person "Michael" "Diamond" 43

-- let beastieBoys = [mca, adRock, mikeD]
-- mikeD `elem` beastieBoys

--- Show Me How to Read
data Person' = Person' { firstName' :: String
                       , lastName' :: String
                       , age' :: Int } deriving (Eq, Show, Read)

mikeD' = Person' { firstName' = "Michael", lastName' = "Diamond", age' = 43 }

-- *Main> mikeD'
-- Person' {firstName' = "Michael", lastName' = "Diamond", age' = 43}
-- *Main> "mikeD is " ++ show mikeD'
-- "mikeD is Person' {firstName' = \"Michael\", lastName' = \"Diamond\", age' = 43}"

mysteryDude = "Person' { firstName' = \"Michael\", lastName' = \"Diamond\", age' = 43 }"
-- *Main> read mysteryDude :: Person'
-- Person' {firstName' = "Michael", lastName' = "Diamond", age' = 43}

-- *Main> read mysteryDude == mikeD'
-- True


-- *Main> read "Just 3" :: Maybe a

-- <interactive>:63:1:
--     No instance for (Read a1) arising from a use of `read'
--     Possible fix:
--       add (Read a1) to the context of
--         an expression type signature: Maybe a1
--         or the inferred type of it :: Maybe a
--     In the expression: read "Just 3" :: Maybe a
--     In an equation for `it': it = read "Just 3" :: Maybe a
-- *Main> read "Just 3" :: Maybe Int
-- Just 3

--- Order in the Court!

-- *Main> True `compare` False
-- GT
-- *Main> True > False
-- True
-- *Main> True < False
-- False
-- *Main> Nothing < Just 100
-- True
-- *Main> Nothing > Just (-49999)
-- False
-- *Main> Just 3 `compare` Just 2
-- GT
-- *Main> Just 100 > Just 50
-- True

--- Any Day of the Week
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving (Eq, Ord, Show, Read, Bounded, Enum)

-- *Main> Wednesday
-- Wednesday
-- *Main> show Wednesday
-- "Wednesday"
-- *Main> read "Saturday" :: Day
-- Saturday
-- *Main> Saturday == Sunday
-- False
-- *Main> Saturday == Saturday
-- True
-- *Main> Saturday > Friday
-- True
-- *Main> Monday `compare` Wednesday
-- LT
-- *Main> succ Monday
-- Tuesday
-- *Main> pred Saturday
-- Friday
-- *Main> [Tuesday .. Sunday]
-- [Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday]
-- *Main> [minBound .. maxBound] :: [Day]
-- [Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday]

