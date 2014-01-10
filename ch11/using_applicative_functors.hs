import Control.Applicative

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
-- *Main Control.Applicative> pure (+) <*> Just 3 <*> Just 5
-- Just 8
-- *Main Control.Applicative> pure (+) <*> Just 3 <*> Nothing
-- Nothing
-- *Main Control.Applicative> pure (+) <*> Nothing <*> Just 5
-- Nothing

-- *Main Control.Applicative> (++) <$> Just "johntra" <*> Just "volta"
-- Just "johntravolta"
-- *Main Control.Applicative> (++) "johntra" "volta"
-- "johntravolta"

--- Lists

-- *Main Control.Applicative> pure "Hey" :: [String]
-- ["Hey"]
-- *Main Control.Applicative> pure "Hey" :: Maybe String
-- Just "Hey"

-- *Main Control.Applicative> [(*0),(+100),(^2)] <*> [1,2,3]
-- [0,0,0,101,102,103,1,4,9]
-- *Main Control.Applicative> [(+),(*)] <*> [1,2] <*> [3,4]
-- [4,5,5,6,3,4,6,8]
-- *Main Control.Applicative> (++) <$> ["ha", "heh","hmm"] <*> ["?", "!", "."]
-- ["ha?","ha!","ha.","heh?","heh!","heh.","hmm?","hmm!","hmm."]
-- *Main Control.Applicative> (+) <$> [1,2,3] <*> [4,5,6]
-- [5,6,7,6,7,8,7,8,9]
-- *Main Control.Applicative> [x*y | x <- [2,5,10], y <- [8,10,11]]
-- [16,20,22,40,50,55,80,100,110]
-- *Main Control.Applicative> (*) <$> [2,5,10] <*> [8,10,11]
-- [16,20,22,40,50,55,80,100,110]
-- *Main Control.Applicative> filter (>50) $ (*) <$> [2,5,10] <*> [8,10,11]
-- [55,80,100,110]

--- IO Is An Applicative Functor, Too
myAction :: IO String
myAction = do
  a <- getLine
  b <- getLine
  return $ a ++ b

myAction' :: IO String
myAction' = (++) <$> getLine <*> getLine

--- Functions As Applicatives

-- to be continued

