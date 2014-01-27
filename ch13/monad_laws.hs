import Control.Monad

--- Left Identity

-- *Main Control.Monad> return 3 >>= (\x -> Just (x+100000))
-- Just 100003
-- *Main Control.Monad> (\x -> Just (x+100000)) 3
-- Just 100003

-- *Main Control.Monad> return "WoM" >>= (\x -> [x,x,x])
-- ["WoM","WoM","WoM"]
-- *Main Control.Monad> (\x -> [x,x,x]) "WoW"
-- ["WoW","WoW","WoW"]

--- Right Identity
-- *Main Control.Applicative> Just "move on up" >>= (\x -> return x)
-- Just "move on up"
-- *Main Control.Applicative> [1,2,3,4] >>= (\x -> return x)
-- [1,2,3,4]
-- *Main Control.Applicative> putStrLn "Wah!" >>= (\x -> return x)
-- Wah!
-- *Main Control.Applicative> :t putStrLn
-- putStrLn :: String -> IO ()

--- Associativity

-- From the last section
type Birds = Int
type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
  | abs ((left + n) - right) < 4 = Just (left + n, right)
  | otherwise = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
  | abs (left - (right + n)) < 4 = Just (left, right + n)
  | otherwise = Nothing

banana :: Pole -> Maybe Pole
banana _ = Nothing

-- End of the codes from the last section

-- *Main> return (0, 0) >>= landRight 2 >>= landLeft 2 >>= landRight 2
-- Just (2,4)
-- *Main> ((return (0, 0) >>= landRight 2) >>= landLeft 2) >>= landRight 2
-- Just (2,4)

-- *Main> return (0, 0) >>= (\x -> landRight 2 x >>= (\y -> landLeft 2 y >>= (\z -> landRight 2 z)))
-- Just (2,4)

-- *Main> :t (<=<)
-- (<=<) :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c
-- *Main> let f x = [x, -x]
-- *Main> let g x = [x*3, x*2]
-- *Main> let h = f <=< g
-- *Main> h 3
-- [9,-9,6,-6]

