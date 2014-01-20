import Data.Monoid
import qualified Data.Foldable as F

-- *Main> :t foldr
-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- *Main> :t F.foldr
-- F.foldr :: F.Foldable t => (a -> b -> b) -> b -> t a -> b

-- *Main> foldr (*) 1 [1,2,3]
-- 6
-- *Main> F.foldr (*) 1 [1,2,3]
-- 6
-- *Main> F.foldl (+) 2 (Just 9)
-- 11
-- *Main> F.foldr (+) 2 (Just 9)
-- 11
-- *Main> F.foldr (||) False (Just True)
-- True
-- *Main> F.foldl (||) False (Just True)
-- True

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)
instance F.Foldable Tree where
  foldMap f EmptyTree = mempty
  foldMap f (Node x l r) = F.foldMap f l `mappend`
                           f x `mappend`
                           F.foldMap f r


testTree = Node 5
           (Node 3
            (Node 1 EmptyTree EmptyTree)
            (Node 6 EmptyTree EmptyTree)
           )
           (Node 9
            (Node 8 EmptyTree EmptyTree)
            (Node 10 EmptyTree EmptyTree)
           )

-- *Main> F.foldl (+) 0 testTree
-- 42
-- *Main> F.foldl (*) 1 testTree
-- 64800

-- *Main> getAny $ F.foldMap (\x -> Any $ x == 3) testTree
-- True

-- *Main> :i Any
-- newtype Any = Any {getAny :: Bool} 	-- Defined in `Data.Monoid'
-- instance Bounded Any -- Defined in `Data.Monoid'
-- instance Eq Any -- Defined in `Data.Monoid'
-- instance Ord Any -- Defined in `Data.Monoid'
-- instance Read Any -- Defined in `Data.Monoid'
-- instance Show Any -- Defined in `Data.Monoid'
-- instance Monoid Any -- Defined in `Data.Monoid'

-- *Main> getAny $ F.foldMap (\x -> Any $ x > 15) testTree
-- False

-- *Main> F.foldMap (\x -> [x]) testTree
-- [1,3,6,5,8,9,10]
