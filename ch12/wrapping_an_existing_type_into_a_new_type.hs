--- Wrapping an Existing Type into a New Type

-- *Main Control.Applicative> [(+1),(*100),(*5)] <*> [1,2,3]
-- [2,3,4,100,200,300,5,10,15]

-- *Main Control.Applicative> getZipList $ ZipList [(+1),(*100),(*5)] <*> ZipList [1,2,3]
-- [2,200,15]

-- *Main Control.Applicative> newtype CharList = CharList { getCharList :: [Char]} deriving (Eq, Show)
-- *Main Control.Applicative> CharList "this will be shown!"
-- CharList {getCharList = "this will be shown!"}
-- *Main Control.Applicative> CharList "benny" == CharList "benny"
-- True
-- *Main Control.Applicative> CharList "benny" == CharList "oisters"
-- False

-- *Main Control.Applicative> :t CharList
-- CharList :: [Char] -> CharList

-- *Main Control.Applicative> :t getCharList
-- getCharList :: CharList -> [Char]

-- *Main Control.Applicative> getCharList $ CharList "this will be shown!"
-- "this will be shown!"

--- Using newtype to Make Type Class Instances

-- to be continued
