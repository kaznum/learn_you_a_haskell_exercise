numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))

-- map (+3) [1,6,3,2]
-- map (\x -> x + 3) [1,6,3,2]

-- to be continued