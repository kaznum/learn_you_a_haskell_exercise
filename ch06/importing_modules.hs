import Data.List (nub, sort)

numUniques :: (Eq a) => [a] ->Int
numUniques = length . nub
-- :m + Data.List Data.Map Data.Set
import Data.List hiding (nub)
import qualified Data.Map
import qualified Data.Map as M
