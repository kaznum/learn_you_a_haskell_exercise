import qualified Data.Map as Map
import Data.Char
--- Almost As Good: Association Lists

phoneBook = [("betty", "555-2938")
            ,("bonnie", "452-2928")
            ,("patsy", "493-2928")
            ,("lucille", "205-2928")
            ,("wendy", "939-8282")
            ,("penny", "853-2492")]

findKey :: (Eq k) => k -> [(k, v)] -> v
findKey key = snd . head . filter (\(k,v) -> k == key)

findKey' :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey' key [] = Nothing
findKey' key ((k,v):xs)
         | key == k = Just v
         | otherwise = findKey' key xs
-- *Main> findKey' "bonnie" phoneBook
-- Just "452-2928"
-- *Main> findKey' "bon" phoneBook
-- Nothing

findKey'' :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey'' key = foldr (\(k, v) acc -> if key == k then Just v else acc) Nothing

-- *Main> findKey'' "bonnie" phoneBook
-- Just "452-2928"
-- *Main> findKey'' "nie" phoneBook
-- Nothing

--- Enter Data.Map
-- Map.fromList [(3, "shoes"), (4,"trees"), (9, "bees")]
-- Map.fromList [("kima", "greggs"), ("jimmy", "mcnulty"), ("jay", "landsman")]

-- Map.fromList [("MS", 1),("MS", 2),("MS", 3)]

-- :t Map.fromList
---- Map.fromList :: Ord k => [(k, a)] -> Map.Map k a

phoneBook' :: Map.Map String String
phoneBook' = Map.fromList [("betty", "555-2938")
                          ,("bonnie", "452-2928")
                          ,("patsy", "493-2928")
                          ,("lucille", "205-2928")
                          ,("wendy", "939-8282")
                          ,("penny", "853-2492")]
                          

-- :t  Map.lookup
---- Map.lookup :: Ord k => k -> Map.Map k a -> Maybe a
-- *Main> Map.lookup "betty" phoneBook'
-- Just "555-2938"
-- *Main> Map.lookup "wendy" phoneBook'
-- Just "939-8282"
-- *Main> Map.lookup "grace" phoneBook'
-- Nothing

-- *Main> :t Map.insert
-- Map.insert :: Ord k => k -> a -> Map.Map k a -> Map.Map k a
-- *Main> let newBook = Map.insert "grace" "341-9021" phoneBook'
-- *Main> Map.lookup "grace" newBook
-- Just "341-9021"

-- *Main> :t Map.size
-- Map.size :: Map.Map k a -> Int
-- *Main> Map.size phoneBook'
-- 6
-- *Main> Map.size newBook
-- 7

string2digits :: String -> [Int]
string2digits = map digitToInt . filter isDigit
-- *Main> string2digits "948-9282"
-- [9,4,8,9,2,8,2]

-- *Main> string2digits "948-9282"
-- [9,4,8,9,2,8,2]
-- *Main> let intBook = Map.map string2digits phoneBook'
-- *Main> :t intBook
-- intBook :: Map.Map String [Int]
-- *Main> Map.lookup "betty" intBook
-- Just [5,5,5,2,9,3,8]

phoneBook'' = [("betty", "555-2938")
              ,("betty", "342-2492")
              ,("bonnie", "452-2928")
              ,("patsy", "493-2928")
              ,("patsy", "943-2929")
              ,("patsy", "827-9162")
              ,("lucille", "205-2928")
              ,("wendy", "939-8282")
              ,("penny", "853-2492")
              ,("penny", "555-2111")]

-- *Main> Map.fromList phoneBook''
-- fromList [("betty","342-2492"),("bonnie","452-2928"),("lucille","205-2928"),("patsy","827-9162"),("penny","555-2111"),("wendy","939-8282")]
phoneBookToMap :: (Ord k) => [(k, String)] -> Map.Map k String
phoneBookToMap xs = Map.fromListWith add xs
               where add number1 number2 = number1 ++ ", " ++ number2

-- *Main> phoneBookToMap phoneBook''
-- fromList [("betty","342-2492, 555-2938"),("bonnie","452-2928"),("lucille","205-2928"),("patsy","827-9162, 943-2929, 493-2928"),("penny","555-2111, 853-2492"),("wendy","939-8282")]
-- *Main> Map.lookup "patsy" $ phoneBookToMap phoneBook
-- Just "493-2928"
-- *Main> Map.lookup "patsy" $ phoneBookToMap phoneBook''
-- Just "827-9162, 943-2929, 493-2928"
-- *Main> Map.lookup "wendy" $ phoneBookToMap phoneBook''
-- Just "939-8282"
-- *Main> Map.lookup "betty" $ phoneBookToMap phoneBook''
-- Just "342-2492, 555-2938"

phoneBookToMap' :: (Ord k) => [(k, a)] -> Map.Map k [a]
phoneBookToMap' xs = Map.fromListWith (++) $ map (\(k, v) -> (k, [v])) xs

-- *Main> Map.lookup "patsy" $ phoneBookToMap' phoneBook''
-- Just ["827-9162","943-2929","493-2928"]

-- *Main> Map.fromListWith max [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11)]
-- fromList [(2,100),(3,29)]
-- *Main> Map.fromListWith (+) [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11)]
-- fromList [(2,108),(3,62)]

