applyTwice :: (a -> a) -> a ->a
applyTwice f x = f (f x)
-- applyTwice (* 2) 2
-- applyTwice (++ " HAHA") "HEY"
-- applyTwice ("HAHA " ++) "HEY"
-- applyTwice (3:) [1]

--- Implementing zipWith

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
-- zipWith' (+) [4,2,5,6] [2,6,2,3]
-- zipWith' max [6,3,2,1] [7,3,1,5]
-- zipWith' (*) (replicate 5 2) [1..]
-- zipWith' (zipWith' (*)) [[1,2,3],[3,5,6],[2,3,4]] [[3,2,2],[3,4,5],[5,4,3]]

--- Implementing flip

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
      where g x y = f y x
flip'' :: (a -> b -> c) -> b -> a -> c
flip'' f x y = f y x

-- zip [1,2,3,4,5] "hello"
-- flip'' zip [1,2,3,4,5] "hello"
-- zipWith div [2,2...] [10,8,6,4,2]
-- zipWith div [2,2..] [10,8,6,4,2]
-- zipWith (flip' div) [2,2..] [10,8,6,4,2]
