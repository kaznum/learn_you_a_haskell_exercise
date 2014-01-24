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


-- to be continued