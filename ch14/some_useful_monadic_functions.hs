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

-- to be continued
