-- *Main> import Control.Applicative
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

-- to be continued