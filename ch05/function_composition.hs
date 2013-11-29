-- map (\x -> negate (abs x)) [5,-3,-6,7,-3,2]
-- map (negate . abs) [5,-3,-6,7,-3,2]

-- map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]
-- map (negate . sum . tail) [[1..5],[3..6],[1..7]]

--- Function Composition with Multiple Parameters
-- sum (replicate 5 (max 6.7 8.9))
-- sum (replicate 5 $ max 6.7 8.9)
-- (sum . replicate 5) $ max 6.7 8.9
-- sum . replicate 5 $ max 6.7 8.9
-- sum $ replicate 5 $ max 6.7 8.9

-- replicate 2 (product (map (*3) (zipWith max [1,2] [4,5])))
-- replicate 2 . product . map (*3) $ zipWith max [1,2] [4,5]

--- Point-Free Style
sum' :: (Num a) => [a] -> a
sum' xs = foldl (+) 0 xs
sum'' :: (Num a) => [a] -> a
sum'' = foldl (+) 0

fn x = ceiling (negate (tan (cos (max 50 x))))
fn' x = ceiling (negate (tan (cos $ max 50 x)))
fn'' = ceiling . negate . tan . cos . max 50

oddSquareSum :: Integer
oddSquareSum = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))

oddSquareSum' :: Integer
oddSquareSum' = sum . takeWhile (<10000) . filter odd $ map (^2) [1..]
