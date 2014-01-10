-- *Main> :t fmap (++) (Just "hey")
-- fmap (++) (Just "hey") :: Maybe ([Char] -> [Char])
-- *Main> :t fmap compare (Just 'a')
-- fmap compare (Just 'a') :: Maybe (Char -> Ordering)
-- *Main> :t fmap compare "A LIST OF CHARS"
-- fmap compare "A LIST OF CHARS" :: [Char -> Ordering]
-- *Main> :t fmap (\x y z -> x + y / z) [3,4,5,6]
-- fmap (\x y z -> x + y / z) [3,4,5,6]
--   :: Fractional a => [a -> a -> a]

-- *Main> let a = fmap (*) [1,2,3,4]
-- *Main> :t a
-- a :: [Integer -> Integer]
-- *Main> fmap (\f -> f 9) a
-- [9,18,27,36]

--- Say Hello to Applicative

--- Maybe the Applicative Functor

-- *Main> import Control.Applicative
-- *Main Control.Applicative> Just (+3) <*> Just 9
-- Just 12
-- *Main Control.Applicative> pure (+3) <*> Just 10
-- Just 13
-- *Main Control.Applicative> pure (+3) <*> Just 9
-- Just 12
-- *Main Control.Applicative> Just (++"hahah") <*> Nothing
-- Nothing
-- *Main Control.Applicative> Nothing <*> Just "woot"
-- Nothing

--- Applicative Style


-- to be continued
