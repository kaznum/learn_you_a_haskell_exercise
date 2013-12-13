class YesNo a where
  yesno :: a -> Bool

instance YesNo Int where
  yesno 0 = False
  yesno _ = True

instance YesNo [a] where
  yesno [] = False
  yesno _ = True

instance YesNo Bool where
  yesno = id

instance YesNo (Maybe a) where
  yesno (Just _) = True
  yesno Nothing = False

data Tree a = EmptyTree | Node a (Tree a) (Tree a)

instance YesNo (Tree a) where
  yesno EmptyTree = False
  yesno _ = True

data TrafficLight = Red | Green | Yellow
instance YesNo TrafficLight where
  yesno Red = False
  yesno _ = True

-- *Main> yesno $ length []
-- False
-- *Main> yesno "haha"
-- True
-- *Main> yesno ""
-- False
-- *Main> yesno $ Just 0
-- True
-- *Main> yesno True
-- True
-- *Main> yesno EmptyTree
-- False
-- *Main> yesno []
-- False
-- *Main> yesno [0,0,0]
-- True
-- *Main> :t yesno
-- yesno :: YesNo a => a -> Bool

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult =
  if yesno yesnoVal
  then yesResult
  else noResult

-- *Main> yesnoIf [] "YEAH!" "NO!"
-- "NO!"
-- *Main> yesnoIf [2,3,4] "YEAH!" "NO!"
-- "YEAH!"
-- *Main> yesnoIf True "YEAH!" "NO!"
-- "YEAH!"
-- *Main> yesnoIf (Just 500) "YEAH!" "NO!"
-- "YEAH!"
-- *Main> yesnoIf Nothing "YEAH!" "NO!"
-- "NO!"
