import Control.Monad.Error

-- *Main> :t Right 4
-- Right 4 :: Num b => Either a b
-- *Main> :t Left "out of cheese error"
-- Left "out of cheese error" :: Either [Char] b

-- *Main> strMsg "boom!" :: String
-- "boom!"

-- *Main> Left "boom" >>= \x -> return (x+1)
-- Left "boom"
-- *Main> Left "boom" >>= \x -> Left "no way!"
-- Left "boom"
-- *Main> Right 100 >>= \x -> Left "no way!"
-- Left "no way!"

-- *Main> Right 3 >>= \x -> return (x + 100)
-- Right 103

-- *Main> Right 3 >>= \x -> return (x + 100) :: Either String Int
-- Right 103
