import Control.Applicative
import Control.Monad.Instances

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
addStuff :: Int -> Int
addStuff = do
  a <- (*2)
  b <- (+10)
  return (a+b)

-- *Main> addStuff 3
-- 19

addStuff' :: Int -> Int
addStuff' x = let
  a = (*2) x
  b = (+10) x
  in a+b

-- *Main> addStuff' 3
-- 19

