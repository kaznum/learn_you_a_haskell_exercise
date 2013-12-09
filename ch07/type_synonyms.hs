import qualified Data.Map as Map
--- Making Our Phonebook Prettier

phoneBook :: [(String, String)]
phoneBook = [("betty", "555-2938")
            ,("bonnie", "452-2928")
            ,("patsy", "493-2928")
            ,("lucille", "205-2928")
            ,("wendy", "939-8282")
            ,("penny", "853-2492")]

-- type PhoneBook = [(String, String)]
type PhoneNumber = String
type Name = String
type PhoneBook = [(Name, PhoneNumber)]

inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name pnumber pbook = (name, pnumber) `elem` pbook

--- Parameterizing Type Synonyms
type AssocList k v = [(k, v)]

type IntMap v = Map.Map Int v
type IntMap' = Map.Map Int

-- [(1,2), (3,5),(8,9)] :: AssocList Int Int

--- Go Left, Then Right

data Either' a b = Left' a | Right' b deriving (Eq, Ord, Read, Show)

-- Main.Right 20
-- Main.Left "w00t"

-- :t Main.Right 'a'
-- :t Main.Left True


data LockerState = Taken | Free deriving (Show, Eq)
type Code = String
type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either' String Code
lockerLookup lockerNumber map = case Map.lookup lockerNumber map of
  Nothing -> Left' $ "Locker " ++ show lockerNumber ++ " doesn't exist!"
  Just (state, code) -> if state /= Taken
                          then Right' code
                          else Left' $ "Locker " ++ show lockerNumber ++ " is already taken"

lockers :: LockerMap
lockers = Map.fromList
          [(100, (Taken, "ZD39I"))
          ,(101, (Free, "JAH3I"))
          ,(103, (Free, "IQSA9"))
          ,(105, (Free, "QOTSA"))
          ,(109, (Taken, "893JJ"))
          ,(110, (Taken, "99292"))]

-- lockerLookup 101 lockers
-- lockerLookup 100 lockers
-- lockerLookup 102 lockers
-- lockerLookup 110 lockers
-- lockerLookup 105 lockers

