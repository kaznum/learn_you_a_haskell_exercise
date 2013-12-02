--- Counting Words

import Data.List
import Data.Char

-- words "hey these are the words in this sentence"
-- words "hey    these    are  the words in this sentence"

-- group [1,1,1,1,2,2,2,2,3,3,2,2,2,5,6,7]
-- group ["boom", "bip", "bip", "boom", "boom"]

-- sort [5,4,3,7,2,1]
-- sort ["boom", "bip", "bip", "boom", "boom"]

wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words

--- Needle in the Haystack

-- tails "party"
-- tails [1,2,3]

-- "hawaii" `isPrefixOf` "hawaii joe"
-- "haha" `isPrefixOf` "ha"
-- "ha" `isPrefixOf` "ha"
-- any (> 4) [1,2,3]
-- any (== 'F') "Frank Sobotka"
-- any (\x -> x > 5 && x < 10) [1,4,11]

isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)

-- "art" `isIn` "party"
-- [1,2] `isIn` [1,3,5]

-- "art" `isInfixOf` "party"

--- Caesar Cipher Salad
-- ord 'a'
-- chr 97
-- map ord "abcdefgh"

encode :: Int -> String -> String
encode offset = map $ chr . (+ offset) . ord

-- encode 3 "hey mark"
-- encode 5 "please instruct your men"
-- encode 1 "to party hard"


decode :: Int -> String -> String
decode offset = encode $ negate offset

-- decode 3 "kh|#pdun"
-- decode 5 "uqjfxj%nsxywzhy%~tzw%rjs"
-- decode 1 "up!qbsuz!ibse"

--- On Strict Left Folds

-- foldl (+) 0 (replicate 100 1)
-- foldl (+) 0 (replicate 100000000 1)
---- <interactive>: memory allocation failed (requested 1048576 bytes)
---- Process haskell exited abnormally with code 1

-- foldl' (+) 0 (replicate 100000000 1)
---- 100000000

--- Let's Find Some Cool Numbers

-- digitToInt '2'
-- digitToInt 'F'
-- digitToInt 'z'

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show
---- *Main> digitSum 123
---- 6
---- *Main> digitSum 256
---- 13

-- *Main> :t find
-- find :: (a -> Bool) -> [a] -> Maybe a
-- *Main> Nothing
-- Nothing
-- *Main> Just "hey"
-- Just "hey"
-- *Main> Just 3
-- Just 3
-- *Main> :t Just "hey"
-- Just "hey" :: Maybe [Char]
-- *Main> :t Just True
-- Just True :: Maybe Bool

-- find (> 4) [3,4,5,6,7]
-- find odd [2,4,6,8,9]
-- find (== 'z') "mjolnir"

firstTo40 :: Maybe Int
firstTo40 = find (\x -> digitSum x == 40) [1..]

firstTo :: Int -> Maybe Int
firstTo n = find (\x -> digitSum x == n) [1..]

-- *Main> firstTo 27
-- Just 999
-- *Main> firstTo 1
-- Just 1
-- *Main> firstTo 49
-- Just 499999
-- *Main> firstTo 13
-- Just 49

