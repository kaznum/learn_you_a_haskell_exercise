data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)
data Crumb a = LeftCrumb a (Tree a) | RightCrumb a (Tree a) deriving (Show)
type Breadcrumbs a = [Crumb a]
type Zipper a = (Tree a, Breadcrumbs a)

goLeft :: Zipper a -> Maybe (Zipper a)
goLeft (Node x l r, bs) = Just (l, LeftCrumb x r:bs)
goLeft (Empty, _) = Nothing

goRight :: Zipper a -> Maybe (Zipper a)
goRight (Node x l r, bs) = Just (r, LeftCrumb x l:bs)
goRight (Empty, _) = Nothing

-- *Main> goLeft (Empty, [])
-- Nothing
-- *Main> goLeft (Node 'A' Empty Empty, [])
-- Just (Empty,[LeftCrumb 'A' Empty])

goUp :: Zipper a -> Maybe (Zipper a)
goUp (t, LeftCrumb x r:bs) = Just (Node x t r, bs)
goUp (t, RightCrumb x l:bs) = Just (Node x l t, bs)
goUp (_, []) = Nothing

-- *Main> let coolTree = Node 1 Empty (Node 3 Empty Empty)
-- *Main> return (coolTree, []) >>= goRight
-- Just (Node 3 Empty Empty,[LeftCrumb 1 Empty])
-- *Main> return (coolTree, []) >>= goRight >>= goRight
-- Just (Empty,[LeftCrumb 3 Empty,LeftCrumb 1 Empty])
-- *Main> return (coolTree, []) >>= goRight >>= goRight >>= goRight
-- Nothing
-- *Main> return (coolTree, []) >>= goUp
-- Nothing
-- *Main> return (coolTree, []) >>= goRight >>= goUp
-- Just (Node 1 (Node 3 Empty Empty) Empty,[])

