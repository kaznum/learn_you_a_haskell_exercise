import Control.Applicative
import Control.Monad

-- *Main Control.Applicative> (*) <$> [1,2,3] <*> [10,100,1000]
-- [10,100,1000,20,200,2000,30,300,3000]

-- *Main Control.Applicative> concat [[1,2],[3,4]]
-- [1,2,3,4]

-- *Main Control.Applicative> [3,4,5] >>= \x -> [x, -x]
-- [3,-3,4,-4,5,-5]

-- *Main Control.Applicative> [] >>= \x -> ["bad","mad","rad"]
-- []

-- *Main Control.Applicative> [1,2,3] >>= \x -> []
-- []

-- *Main Control.Applicative> [1,2] >>= \n -> ['a','b'] >>= \ch -> return (n, ch)
-- [(1,'a'),(1,'b'),(2,'a'),(2,'b')]

listOfTuples :: [(Int, Char)]
listOfTuples = do
  n <- [1,2]
  ch <- ['a', 'b']
  return (n, ch)

-- *Main Control.Applicative> listOfTuples
-- [(1,'a'),(1,'b'),(2,'a'),(2,'b')]

--- do Notation and List Comprehensions
-- *Main> [(n, ch) | n <- [1,2], ch <- ['a', 'b']]
-- [(1,'a'),(1,'b'),(2,'a'),(2,'b')]

--- MonadPlus and the guard Function
-- *Main> [x | x <- [1..50], '7' `elem` show x]
-- [7,17,27,37,47]

-- *Main Control.Monad> guard (5 > 2) :: Maybe ()
-- Just ()
-- *Main Control.Monad> guard (1 > 2) :: Maybe ()
-- Nothing
-- *Main Control.Monad> guard (5 > 2) :: [()]
-- [()]
-- *Main Control.Monad> guard (1 > 2) :: [()]
-- []
-- *Main Control.Monad> [1..50] >>= (\x -> guard ('7' `elem` show x) >> return x)
-- [7,17,27,37,47]

-- *Main Control.Monad> guard (5 > 2) >> return "cool" :: [String]
-- ["cool"]
-- *Main Control.Monad> guard (1 > 2) >> return "cool" :: [String]
-- []

sevensOnly :: [Int]
sevensOnly = do
  x <- [1..50]
  guard ('7' `elem` show x)
  return x

-- *Main Control.Monad> sevensOnly
-- [7,17,27,37,47]
-- *Main Control.Monad> [x|x<- [1..50], '7' `elem` show x]
-- [7,17,27,37,47]

--- A Knight's Quest

-- to be continued