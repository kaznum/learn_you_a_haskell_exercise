-- *Main> fmap (*2) [1..3]
-- [2,4,6]
-- *Main> map (*2) [1..3]
-- [2,4,6]
-- *Main> fmap (*2) []
-- []
-- *Main> map (*2) []
-- []

--- Maybe As a Functor
-- *Main> fmap (++ " HEY GUYS IM INSIDE THE JUST") (Just "Something serious.")
-- Just "Something serious. HEY GUYS IM INSIDE THE JUST"
-- *Main> fmap (++ " HEY GUYS IM INSIDE THE JUST") Nothing
-- Nothing
-- *Main> fmap (*2) (Just 200)
-- Just 400
-- *Main> fmap (*2) Nothing
-- Nothing

--- Trees Are Functors, Too

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree
treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
           | x == a = Node x left right
           | x < a  = Node a (treeInsert x left) right
           | x > a  = Node a left (treeInsert x right)
treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
         | x == a = True
         | x < a  = treeElem x left
         | x > a  = treeElem x right

instance Functor Tree where
    fmap f EmptyTree = EmptyTree
    fmap f (Node x left right) = Node (f x) (fmap f left) (fmap f right)

-- *Main> fmap (*2) EmptyTree
-- EmptyTree
-- *Main> fmap (*4) (foldr treeInsert EmptyTree [5, 7, 3])
-- Node 12 EmptyTree (Node 28 (Node 20 EmptyTree EmptyTree) EmptyTree)
-- *Main> fmap (*(-1)) (foldr treeInsert EmptyTree [5, 7, 3])
-- Node (-3) EmptyTree (Node (-7) (Node (-5) EmptyTree EmptyTree) EmptyTree)

--- Either a As a Functor
