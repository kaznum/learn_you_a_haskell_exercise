import Control.Applicative

-- Prelude> fmap (\x -> [x]) (Just 4)
-- Just [4]
-- Prelude Control.Applicative> liftA2 (:) (Just 3) (Just [4])
-- Just [3,4]
-- Prelude Control.Applicative> (:) <$> Just 3 <*> Just [4]
-- Just [3,4]

sequenceA :: (Applicative f) => [f a] -> f [a]
sequenceA [] = pure []
sequenceA (x:xs) = (:) <$> x <*> sequenceA xs

-- *Main Control.Applicative> sequenceA [Just 1, Just 2]
-- Just [1,2]

sequenceA' :: (Applicative f) => [f a] -> f [a]
sequenceA' = foldr (liftA2 (:)) (pure [])

-- *Main Control.Applicative> sequenceA' [Just 1, Just 2]
-- Just [1,2]

-- *Main Control.Applicative> sequenceA' [Just 3, Just 2, Just 1]
-- Just [3,2,1]
-- *Main Control.Applicative> sequenceA' [Just 3, Nothing, Just 1]
-- Nothing
-- *Main Control.Applicative> sequenceA' [(+3),(+2),(+1)] 3
-- [6,5,4]
-- *Main Control.Applicative> sequenceA' [[1,2,3],[4,5,6]]
-- [[1,4],[1,5],[1,6],[2,4],[2,5],[2,6],[3,4],[3,5],[3,6]]
-- *Main Control.Applicative> sequenceA' [[1,2,3],[4,5,6],[3,4,4],[]]
-- []

-- *Main Control.Applicative> map (\f -> f 7) [(>4),(<10),odd]
-- [True,True,True]
-- *Main Control.Applicative> and $ map (\f -> f 7) [(>4),(<10),odd]
-- True
-- *Main Control.Applicative> sequenceA [(>4),(<10),odd] 7
-- [True,True,True]
-- *Main Control.Applicative> and $ sequenceA [(>4),(<10),odd] 7
-- True

-- *Main Control.Applicative> sequenceA [[1,2,3],[4,5,6]]
-- [[1,4],[1,5],[1,6],[2,4],[2,5],[2,6],[3,4],[3,5],[3,6]]
-- *Main Control.Applicative> [[x,y]|x <- [1,2,3], y <- [4,5,6]]
-- [[1,4],[1,5],[1,6],[2,4],[2,5],[2,6],[3,4],[3,5],[3,6]]
-- *Main Control.Applicative> sequenceA [[1,2],[3,4]]
-- [[1,3],[1,4],[2,3],[2,4]]
-- *Main Control.Applicative> [[x,y]|x <- [1,2], y <- [3,4]]
-- [[1,3],[1,4],[2,3],[2,4]]
-- *Main Control.Applicative> sequenceA [[1,2],[3,4],[5,6]]
-- [[1,3,5],[1,3,6],[1,4,5],[1,4,6],[2,3,5],[2,3,6],[2,4,5],[2,4,6]]
-- *Main Control.Applicative> [[x,y,z] | x <- [1,2], y <- [3,4], z <- [5,6]]
-- [[1,3,5],[1,3,6],[1,4,5],[1,4,6],[2,3,5],[2,3,6],[2,4,5],[2,4,6]]

-- *Main Control.Applicative> sequenceA [getLine, getLine, getLine]
-- heyh
-- ho
-- woo
-- ["heyh","ho","woo"]

