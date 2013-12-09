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

-- to be continued