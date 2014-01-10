--- I/O Actions As Functors
-- see reverse_input.hs
-- see reverse_input2.hs
-- see fmapping_io

--- Functions As Functors

-- *Main> :t fmap (*3) (+100)
-- fmap (*3) (+100) :: Num a => a -> a
-- *Main> fmap (*3) (+100) 1
-- 303
-- *Main> (*3) `fmap` (+100) $ 1
-- 303
-- *Main> (*3) . (+100) $ 1
-- 303
-- *Main> fmap (show . (*3)) (+100) 1
-- "303"

-- *Main> :t fmap (*2)
-- fmap (*2) :: (Functor f, Num b) => f b -> f b
-- *Main> :t fmap (replicate 3)
-- fmap (replicate 3) :: Functor f => f a -> f [a]

-- *Main> fmap (replicate 3) [5,4,3]
-- [[5,5,5],[4,4,4],[3,3,3]]
-- *Main> :t fmap (++"!")
-- fmap (++"!") :: Functor f => f [Char] -> f [Char]

-- *Main> fmap (replicate 3) [1,2,3,4]
-- [[1,1,1],[2,2,2],[3,3,3],[4,4,4]]
-- *Main> fmap (replicate 3) (Just 4)
-- Just [4,4,4]
-- *Main> fmap (replicate 3) (Right "blah")
-- Right ["blah","blah","blah"]
-- *Main> fmap (replicate 3) (Left "foo")
-- Left "foo"
