map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs
-- map' (+3) [1,5,3,1,6]
-- map' (++ "!") ["BIFF", "BANG", "POW"]
-- map' (replicate 3) [3..6]
-- map' (map' (^2)) [[1,2],[3,4,5,6],[7,8]]
-- map' fst [(1,2),(3,5),(6,3),(2,6),(2,5)]

--- The filter Function
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
        | f x = x : filter' f xs
        | otherwise = filter' f xs

-- filter' (>3) [1,2,3,4,5,6]
-- filter' (==3) [1,2,3,4,5]
-- let notNull x = not (null x) in filter' notNull [[1,2,3],[],[3,4,5],[2,2],[],[]]

-- filter' (`elem` ['a'..'z']) "u dafKdfa dfaiKSDF"
-- filter' (<15) (filter' even [1..20])
-- [x| x <- [1..20], x < 15, even x]

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
          let smallerOrEqual = filter' (<= x) xs
              larger = filter' (> x) xs
          in quicksort smallerOrEqual ++ [x] ++ quicksort larger

--- More Examples of map and filter

largestDivisible :: Integer
largestDivisible = head (filter p [100000,99999..])
                 where p x = x `mod` 3829 == 0

-- takeWhile (/=' ') "elephants know how o party"
-- sum (takeWhile(<10000) (filter odd (map (^2) [1..])))
-- sum (takeWhile (<10000) [m |m <- [n^2 | n <- [1..]], odd m])

-- to be continued