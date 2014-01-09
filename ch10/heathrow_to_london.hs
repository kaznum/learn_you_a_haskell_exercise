--- Calculating the Quickest Path

--- Representing the Road System in Haskell

data Section = Section { getA :: Int, getB :: Int, getC :: Int }
type RoadSystem = [Section]

heathrowToLondon :: RoadSystem
heathrowToLondon = [ Section 50 10 30
                   , Section 5 90 20
                   , Section 40 2 25
                   , Section 10 8 0
                   ]

--- Writing the Optimal Path Function
data Label = A | B | C deriving (Show)
type Path = [(Label, Int)]

roadStep :: (Path, Path) -> Section -> (Path, Path)
roadStep (pathA, pathB) (Section a b c) =
  let timeA = sum (map snd pathA)
      timeB = sum (map snd pathB)
      forwardTimeToA = timeA + a
      crossTimeToA = timeB + b + c
      forwardTimeToB = timeB + b
      crossTimeToB = timeA + a + c
      newPathToA = if forwardTimeToA <= crossTimeToA
                   then (A, a):pathA
                   else (C, c):(B, b):pathB
      newPathToB = if forwardTimeToB <= crossTimeToB
                   then (B, b):pathB
                   else (C, c):(A, a):pathA
  in (newPathToA, newPathToB)

-- *Main> roadStep ([],[]) (head heathrowToLondon)
-- ([(C,30),(B,10)],[(B,10)])

optimalPath :: RoadSystem -> Path
optimalPath roadSystem =
  let (bestAPath, bestBPath) = foldl roadStep ([], []) roadSystem
  in if sum (map snd bestAPath) <= sum (map snd bestBPath)
     then reverse bestAPath
     else reverse bestBPath

-- *Main> optimalPath heathrowToLondon
-- [(B,10),(C,30),(A,5),(C,20),(B,2),(B,8),(C,0)]

--- Getting a Road System from the Input

-- to be continued