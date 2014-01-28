import Control.Applicative

-- *Main> let f = (*5)
-- *Main> let g = (+3)
-- *Main> (fmap f g) 8
-- 55
-- *Main Control.Applicative> let f = (+) <$> (*2) <*> (+10)
-- *Main Control.Applicative> f 3
-- 19

---- (+) <$> (*2) <*> (+10)
---- (fmap (+) (*2)) <*> (+10)
---- (\x -> (+) (x*2)) <*> (\x -> (x+10))
---- (\x -> (+) (x*2) (x+10))


--- Functions As Monads

--- The Reader Monad

-- to be continued
