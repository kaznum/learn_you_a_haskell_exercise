data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)

type ListZipper a = ([a], [a])

goForward :: ListZipper a -> ListZipper a
goForward (x:xs, bs) = (xs, x:bs)

goBack :: ListZipper a -> ListZipper a
goBack (xs, b:bs) = (b:xs, bs)

-- *Main> let xs = [1,2,3,4]
-- *Main> goForward (xs, [])
-- ([2,3,4],[1])
-- *Main> goForward ([2,3,4],[1])
-- ([3,4],[2,1])
-- *Main> goForward ([3,4],[2,1])
-- ([4],[3,2,1])
-- *Main> goBack ([4],[3,2,1])
-- ([3,4],[2,1])
