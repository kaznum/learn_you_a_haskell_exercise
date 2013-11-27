map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs
-- map' (+3) [1,5,3,1,6]
-- map' (++ "!") ["BIFF", "BANG", "POW"]
-- map' (replicate 3) [3..6]
-- map' (map' (^2)) [[1,2],[3,4,5,6],[7,8]]
-- map' fst [(1,2),(3,5),(6,3),(2,6),(2,5)]

--- The filter Function

-- to be continued