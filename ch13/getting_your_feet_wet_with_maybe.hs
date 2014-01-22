import Control.Applicative
import Data.Char

-- *Main> fmap (++ "!") (Just "wisdom")
-- Just "wisdom!"
-- *Main> fmap (++"!") Nothing
-- Nothing

-- *Main> Just (+3) <*> Just 3
-- Just 6
-- *Main> Nothing <*> Just "greed"
-- Nothing
-- *Main> Just ord <*> Nothing
-- Nothing

-- *Main> max <$> Just 3 <*> Just 6
-- Just 6
-- *Main> max <$> Just 3 <*> Nothing
-- Nothing

-- *Main> (\x -> Just (x+1)) 1
-- Just 2
-- *Main> (\x -> Just (x+1)) 100
-- Just 101

applyMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
applyMaybe Nothing f = Nothing
applyMaybe (Just x) f = f x

-- *Main> Just 3 `applyMaybe` \x -> Just (x+1)
-- Just 4
-- *Main> Just "smile" `applyMaybe` \x -> Just (x ++ " :)")
-- Just "smile :)"
-- *Main> Nothing `applyMaybe` \x -> Just (x+1)
-- Nothing
-- *Main> Nothing `applyMaybe` \x -> Just (x ++ " :)")
-- Nothing

-- *Main> Just 3 `applyMaybe` \x -> if x > 2 then Just x else Nothing
-- Just 3
-- *Main> Just 1 `applyMaybe` \x -> if x > 2 then Just x else Nothing
-- Nothing
