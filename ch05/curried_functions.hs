-- max 4 5
-- (max 4) 5

-- :t max
-- :t max 4

multiThree :: Int -> Int -> Int -> Int
multiThree x y z = x * y * z

multiTwoWithNine = multiThree 9
-- multiTwoWithNine 2 3

compareWithHundred :: Int -> Ordering
compareWithHundred x = compare 100 x
-- compareWithHundred 99

compareWithHundred' :: Int -> Ordering
compareWithHundred' = compare 100
-- compareWithHundred 99

--- Sections

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)
-- divideByTen 200
-- 200 / 10
-- (/10) 200

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

--- Printing Functions

