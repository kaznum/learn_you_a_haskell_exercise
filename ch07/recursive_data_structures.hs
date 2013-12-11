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

-- to be continued