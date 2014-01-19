import qualified Data.Foldable as F

-- *Main> :t foldr
-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- *Main> :t F.foldr
-- F.foldr :: F.Foldable t => (a -> b -> b) -> b -> t a -> b

-- *Main> foldr (*) 1 [1,2,3]
-- 6
-- *Main> F.foldr (*) 1 [1,2,3]
-- 6
-- *Main> F.foldl (+) 2 (Just 9)
-- 11
-- *Main> F.foldr (+) 2 (Just 9)
-- 11
-- *Main> F.foldr (||) False (Just True)
-- True
-- *Main> F.foldl (||) False (Just True)
-- True

-- to be continued
