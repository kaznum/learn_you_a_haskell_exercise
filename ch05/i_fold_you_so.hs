--- Left Folds with foldl

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs
-- sum' [3,5,2,1]

sum'' :: (Num a) => [a] -> a
sum'' = foldl (+) 0
-- sum'' [3,5,2,1]

--- Right Folds with foldr
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs

map'' :: (a -> b) -> [a] -> [b]
map'' f xs = foldl (\acc x -> acc ++ [f x]) [] xs

-- take 3 (foldr (\x a -> x:a) [] [1..])
--- [1,2,3]
--- 1:(foldr f [] [2..])
--- 1:(2:(foldr f [] [3..]))
--- 1:(2:(3:(foldr f [] [4..])))
-- take 3 (foldl (\a x -> a ++ [x]) [] [1..])
--- infinite loop
--- [] ++ [1] ++ [2] ++ ...

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldr (\x acc -> if x == y then True else acc) False ys
-- elem' 5 [1..100]
-- elem' 5 [6..100]

--- The foldl and foldr1 Functions

maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 max
-- maximum' [1,3,5,2,3]

--- Some Fold Examples
reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x:acc) []

reverse'' :: [a] -> [a]
reverse'' = foldl (flip (:)) []

product' :: (Num a) => [a] -> a
product' = foldr (*) 1

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x:acc else acc) []

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

--- Another Way to Look at Folds
-- foldr (+) 0 [3,4,5,6]
-- foldl (flip (:)) [] [3,4,5,6]

--- Folding Infinite Lists
and' :: [Bool] -> Bool
and' xs = foldr (&&) True xs

-- and' (repeat False)

--- Scans
-- scanl (+) 0 [3,5,2,1]
-- scanr (+) 0 [3,5,2,1]
-- scanl1 (\acc x -> if x > acc then x else acc) [3,4,5,3,7,9,2,1]
-- scanl (flip (:)) [] [3,2,1]

sqrtSums :: Int
sqrtSums = length (takeWhile (< 1000) (scanl1 (+) (map sqrt [1..]))) + 1

-- sqrtSums
-- sum(map sqrt [1..131])
