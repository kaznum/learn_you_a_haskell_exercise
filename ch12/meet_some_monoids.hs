import Data.Monoid
--- Lists Are Monoids
-- *Main Control.Applicative> [1,2,3] `mappend` [4,5,6]
-- [1,2,3,4,5,6]
-- *Main Control.Applicative> ("one" `mappend` "two") `mappend` "tree"
-- "onetwotree"
-- *Main Control.Applicative> "one" `mappend` ("two" `mappend` "tree")
-- "onetwotree"
-- *Main Control.Applicative> "one" `mappend` "two" `mappend` "tree"
-- "onetwotree"
-- *Main Control.Applicative> "pang" `mappend` mempty
-- "pang"
-- *Main Control.Applicative> mconcat [[1,2],[3,6],[9]]
-- [1,2,3,6,9]
-- *Main Control.Applicative> mempty :: [a]
-- []

-- *Main Control.Applicative> concat [[1,2],[3],[4,5]]
-- [1,2,3,4,5]

-- *Main Control.Applicative> "one" `mappend` "two"
-- "onetwo"
-- *Main Control.Applicative> "two" `mappend` "one"
-- "twoone"

--- Product and Sum
-- *Main Control.Applicative> getProduct $ Product 3 `mappend` Product 9
-- 27
-- *Main Control.Applicative> getProduct $ Product 3 `mappend` mempty
-- 3
-- *Main Control.Applicative> getProduct $ Product 3 `mappend` Product 4 `mappend` Product 2
-- 24
-- *Main Control.Applicative> getProduct . mconcat . map Product $ [3,4,2]
-- 24

-- *Main Control.Applicative> getSum $ Sum 2 `mappend` Sum 9
-- 11
-- *Main Control.Applicative> getSum $ mempty `mappend` Sum 3
-- 3
-- *Main Control.Applicative> getSum . mconcat . map Sum $ [1,2,3]
-- 6

--- Any and All

-- *Main Control.Applicative> getAny $ Any True `mappend` Any False
-- True
-- *Main Control.Applicative> getAny $ mempty `mappend` Any True
-- True
-- *Main Control.Applicative> getAny . mconcat . map Any $ [False, False, False, True]
-- True
-- *Main Control.Applicative> getAny $ mempty `mappend` mempty
-- False

-- *Main> getAll $ mempty `mappend` All True
-- True
-- *Main> getAll $ mempty `mappend` All False
-- False
-- *Main> getAll . mconcat . map All $ [True,True,True]
-- True
-- *Main> getAll . mconcat . map All $ [True,True,False]
-- False
-- *Main> getAll $ mempty `mappend` (mempty :: All)
-- True

--- The Ordering Monoid
-- *Main> 1 `compare` 2
-- LT
-- *Main> 2 `compare` 2
-- EQ
-- *Main> 3 `compare` 2
-- GT

-- *Main> LT `mappend` GT
-- LT
-- *Main> GT `mappend` LT
-- GT
-- *Main> mempty `mappend` LT
-- LT
-- *Main> mempty `mappend` GT
-- GT

lengthCompare :: String -> String -> Ordering
lengthCompare x y = let a = length x `compare` length y
                        b = x `compare` y
                    in if a == EQ then b else a

-- *Main> lengthCompare "zen" "ants"
-- LT
-- *Main> lengthCompare "zen" "ant"
-- GT

lengthCompare' :: String -> String -> Ordering
lengthCompare' x y = (length x `compare` length y) `mappend` (x `compare` y)

-- *Main> lengthCompare' "zen" "ants"
-- LT
-- *Main> lengthCompare' "zen" "ant"
-- GT

lengthCompare'' :: String -> String -> Ordering
lengthCompare'' x y = (length x `compare` length y) `mappend`
                      (vowels x `compare` vowels y) `mappend`
                      (x `compare` y)
                      where vowels = length . filter (`elem` "aeiou")

-- *Main> lengthCompare'' "zen" "anna"
-- LT
-- *Main> lengthCompare'' "zen" "ana"
-- LT
-- *Main> lengthCompare'' "zen" "ann"
-- GT

--- Maybe the Monoid

-- *Main> Nothing `mappend` Just "andy"
-- Just "andy"
-- *Main> Just LT `mappend` Nothing
-- Just LT
-- *Main> Just (Sum 3) `mappend` Just (Sum 4)
-- Just (Sum {getSum = 7})
-- *Main>                       

-- *Main> getFirst $ First (Just 'a') `mappend` First (Just 'b')
-- Just 'a'
-- *Main> getFirst $ First Nothing `mappend` First (Just 'b')
-- Just 'b'
-- *Main> getFirst $ First (Just 'a') `mappend` First Nothing
-- Just 'a'

-- *Main> getFirst . mconcat . map First $ [Nothing, Just 9, Just 10]
-- Just 9

-- *Main> getLast . mconcat . map Last $ [Nothing, Just 9, Just 10]
-- Just 10
-- *Main> getLast $ Last (Just "one") `mappend` Last (Just "two")
-- Just "two"

