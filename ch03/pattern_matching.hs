lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

sayMe :: Int -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"

-- Pattern Matching with Tuples

addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors a b = (fst a + fst b, snd a + snd b)

addVectors' :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- :t addVectors'

first :: (a, b, c) -> a
first (x, _, _) = x
second :: (a, b, c) -> b
second (_, y, _) = y
third :: (a, b, c) -> c
third (_, _, z) = z

-- Pattern Matching with Lists and List Comprehensions

-- let xs = [(1,2),(3,4),(5,6),(7,8),(9,10)]
-- [a+b|(a, b) <- xs]
head' :: [a] -> a
head' [] = error "Cannot call head on an empty list, dummy!"
head' (x:_) = x

-- head' [4,5,6]
-- head' "Hello"

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "The list is long. The first two elements are: " ++ show x ++ " and " ++ show y

-- tell ['a', 'b']
-- tell ['a']
-- tell [1]
-- tell [1,2,3]
-- tell []

badAdd :: (Num a) => [a] -> a
badAdd (x:y:z:[]) = x + y + z

-- badAdd [100, 20]

firstLetter :: String -> String
firstLetter "" = "Empty string"
firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

-- firstLetter "hello"
