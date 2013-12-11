data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)

-- data List a = Empty | Cons { listHead :: a, listTail :: List a } deriving (Show, Read, Eq, Ord)

-- *Main> Empty
-- Empty
-- *Main> 5 `Cons` Empty
-- Cons 5 Empty
-- *Main> 4 `Cons` (5 `Cons` Empty)
-- Cons 4 (Cons 5 Empty)
-- *Main> 3 `Cons` (4 `Cons` (5 `Cons` Empty))
-- Cons 3 (Cons 4 (Cons 5 Empty))

--- Improving Out List
infixr 5 :-:
data List' a = Empty' | a :-: (List' a) deriving (Show, Read, Eq, Ord)

-- *Main> 3 :-: 4 :-: 5 :-: Empty'
-- 3 :-: (4 :-: (5 :-: Empty'))
-- *Main> let a = 3 :-: 4 :-: 5 :-: Empty'
-- *Main> 100 :-: a
-- 100 :-: (3 :-: (4 :-: (5 :-: Empty')))

infixr 5 ^++
(^++) :: List' a -> List' a -> List' a
Empty' ^++ ys = ys
(x :-: xs) ^++ ys = x :-: (xs ^++ ys)

-- *Main> let a = 3 :-: 4 :-: 5 :-: Empty'
-- *Main> let b = 6 :-: 7 :-: Empty'
-- *Main> a ^++ b
-- 3 :-: (4 :-: (5 :-: (6 :-: (7 :-: Empty'))))

--- Let's Plant a Tree
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

-- *Main> let nums = [8,6,4,1,7,3,5]
-- *Main> let numsTree = foldr treeInsert EmptyTree nums
-- *Main> numsTree
-- Node 5
--   (Node 3
--     (Node 1 EmptyTree EmptyTree)
--     (Node 4 EmptyTree EmptyTree)
--   )
--   (Node 7
--     (Node 6 EmptyTree EmptyTree)
--     (Node 8 EmptyTree EmptyTree)
--   )

-- *Main> 8 `treeElem` numsTree
-- True
-- *Main> 100 `treeElem` numsTree
-- False
-- *Main> 1 `treeElem` numsTree
-- True
-- *Main> 10 `treeElem` numsTree
-- False
