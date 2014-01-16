import Data.Monoid
--- Lists Are Monoids
-- *Main Control.Applicative> [1,2,3] `mappend` [4,5,6]
-- [1,2,3,4,5,6]
-- *Main Control.Applicative> ("one" `mappend` "two") `mappend` "tree"
-- "onetwotree"
-- *Main Control.Applicative> "one" `mappend` ("two" `mappend` "tree")
-- "onetwotree"
-- *Main Control.Applicative> "one" `mappend` "two" `mappend` "tree"
-- "onetwotree"
-- *Main Control.Applicative> "pang" `mappend` mempty
-- "pang"
-- *Main Control.Applicative> mconcat [[1,2],[3,6],[9]]
-- [1,2,3,6,9]
-- *Main Control.Applicative> mempty :: [a]
-- []

-- *Main Control.Applicative> concat [[1,2],[3],[4,5]]
-- [1,2,3,4,5]

-- *Main Control.Applicative> "one" `mappend` "two"
-- "onetwo"
-- *Main Control.Applicative> "two" `mappend` "one"
-- "twoone"

--- Product and Sum
-- *Main Control.Applicative> getProduct $ Product 3 `mappend` Product 9
-- 27
-- *Main Control.Applicative> getProduct $ Product 3 `mappend` mempty
-- 3
-- *Main Control.Applicative> getProduct $ Product 3 `mappend` Product 4 `mappend` Product 2
-- 24
-- *Main Control.Applicative> getProduct . mconcat . map Product $ [3,4,2]
-- 24

-- *Main Control.Applicative> getSum $ Sum 2 `mappend` Sum 9
-- 11
-- *Main Control.Applicative> getSum $ mempty `mappend` Sum 3
-- 3
-- *Main Control.Applicative> getSum . mconcat . map Sum $ [1,2,3]
-- 6

--- Any and All


-- to be continue
