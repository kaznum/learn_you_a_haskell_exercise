import Control.Monad
-- *Main> let f = (+1) . (*100)
-- *Main> f 4
-- 401

-- *Main> let g = (\x -> return (x+1)) <=< (\x -> return (x*100)) :: Int -> Maybe Int
-- *Main> Just 4 >>= g
-- Just 401

-- *Main> Just 4 >>= (\x -> return (x+1)) >>= (\x -> return (x*100))
-- Just 500

-- *Main> let f = foldr (.) id [(+1), (*100), (+1)]
-- *Main> f 1
-- 201

-- *Main> let p = foldr (.) id [(+1), (*100), (+2)]
-- *Main> p 1
-- 301

-- to be continued
