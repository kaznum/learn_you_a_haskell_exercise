import Control.Monad
import Control.Monad.Writer
import Control.Monad.State
import Control.Applicative

-- liftM and Friends
-- *Main> liftM (*3) (Just 8)
-- Just 24
-- *Main> fmap (*3) (Just 8)
-- Just 24
-- *Main> runWriter $ liftM not $ writer (True, "chickpeas")
-- (False,"chickpeas")
-- *Main> runWriter $ fmap not $ writer (True, "chickpeas")
-- (False,"chickpeas")

type Stack = [Int]
pop :: State Stack Int
pop = state $ \(x:xs) -> (x, xs)
push :: Int -> State Stack ()
push a = state $ \xs -> ((), a:xs)

-- *Main> runState (liftM (+100) pop) [1,2,3,4]
-- (101,[2,3,4])
-- *Main> runState (fmap (+100) pop) [1,2,3,4]
-- (101,[2,3,4])
-- *Main> :t liftM
-- liftM :: Monad m => (a1 -> r) -> m a1 -> m r
-- *Main> :t fmap
-- fmap :: Functor f => (a -> b) -> f a -> f b

-- *Main> (+) <$> Just 3 <*> Just 5
-- Just 8
-- *Main> (+) <$> Just 3 <*> Nothing
-- Nothing

-- *Main> Just (+3) <*> Just 4
-- Just 7
-- *Main> Just (+3) `ap` Just 4
-- Just 7
-- *Main> [(+1),(+2),(+3)] <*> [10,11]
-- [11,12,12,13,13,14]
-- *Main> [(+1),(+2),(+3)] `ap` [10,11]
-- [11,12,12,13,13,14]

-- *Main> :t liftA2
-- liftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c

-- *Main> :t liftM2
-- liftM2 :: Monad m => (a1 -> a2 -> r) -> m a1 -> m a2 -> m r
-- *Main> :t liftM3
-- liftM3
--   :: Monad m => (a1 -> a2 -> a3 -> r) -> m a1 -> m a2 -> m a3 -> m r
-- *Main> :t liftM4
-- liftM4
--   :: Monad m =>
--      (a1 -> a2 -> a3 -> a4 -> r) -> m a1 -> m a2 -> m a3 -> m a4 -> m r
-- *Main> :t liftM5
-- liftM5
--   :: Monad m =>
--      (a1 -> a2 -> a3 -> a4 -> a5 -> r)
--      -> m a1 -> m a2 -> m a3 -> m a4 -> m a5 -> m r


--- The join Function

-- to be continued
