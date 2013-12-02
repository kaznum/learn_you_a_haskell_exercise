--- Counting Words

import Data.List (words, group, sort, tails, isPrefixOf, any, isInfixOf)

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

-- to be continued