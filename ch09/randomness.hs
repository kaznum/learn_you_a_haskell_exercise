-- *Main> import System.Random
-- *Main System.Random> random (mkStdGen 100)

-- <interactive>:6:1:
--     No instance for (Random a0) arising from a use of `random'
--     The type variable `a0' is ambiguous
--     Possible fix: add a type signature that fixes these type variable(s)
--     Note: there are several potential instances:
--       instance Random Bool -- Defined in `System.Random'
--       instance Random Foreign.C.Types.CChar -- Defined in `System.Random'
--       instance Random Foreign.C.Types.CDouble
--         -- Defined in `System.Random'
--       ...plus 33 others
--     In the expression: random (mkStdGen 100)
--     In an equation for `it': it = random (mkStdGen 100)
-- *Main System.Random> random (mkStdGen 100) :: (Int, StdGen)
-- (-3650871090684229393,693699796 2103410263)
-- *Main System.Random> random (mkStdGen 100) :: (Int, StdGen)
-- (-3650871090684229393,693699796 2103410263)
-- *Main System.Random> random (mkStdGen 949494) :: (Int, StdGen)
-- (261237333865217244,75809027 2103410263)
-- *Main System.Random> random (mkStdGen 949488) :: (Float, StdGen)
-- (0.8241101,1597344447 1655838864)
-- *Main System.Random> random (mkStdGen 949488) :: (Bool, StdGen)
-- (False,1485632275 40692)
-- *Main System.Random> random (mkStdGen 949488) :: (Integer, StdGen)
-- (2779100082051559757,587416689 2103410263)

--- Tossing a Coin

import System.Random
threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen =
  let (firstCoin, newGen) = random gen
      (secondCoin, newGen') = random newGen
      (thirdCoin, newGen'') = random newGen'
  in (firstCoin, secondCoin, thirdCoin)

-- *Main System.Random> threeCoins (mkStdGen 21)
-- (True,True,True)
-- *Main System.Random> threeCoins (mkStdGen 22)
-- (True,False,True)
-- *Main System.Random> threeCoins (mkStdGen 943)
-- (True,False,True)
-- *Main System.Random> threeCoins (mkStdGen 944)
-- (True,True,True)

--- More Random Functions

-- *Main System.Random> take 5 $ randoms (mkStdGen 11) :: [Int]
-- [5258698905265467991,-1046130112415077602,3603401487739301952,-595625523242114439,-242088768969841391]
-- *Main System.Random> take 5 $ randoms (mkStdGen 11) :: [Bool]
-- [True,True,True,True,False]
-- *Main System.Random> take 5 $ randoms (mkStdGen 11) :: [Float]
-- [0.23626214,0.48899883,0.4896804,0.29281616,2.5201797e-2]

randoms' :: (RandomGen g, Random a) => g -> [a]
randoms' gen = let (value, newGen) = random gen in value:randoms' newGen

finiteRandoms :: (RandomGen g, Random a, Num n, Eq n) => n -> g -> ([a], g)
finiteRandoms 0 gen = ([], gen)
finiteRandoms n gen =
  let (value, newGen) = random gen
      (restOfList, finalGen) = finiteRandoms (n-1) newGen
  in (value:restOfList, finalGen)

-- *Main System.Random> finiteRandoms 5 (mkStdGen 100) :: ([Int], StdGen)
-- ([-3650871090684229393,-9143854998136150815,3895500410229592485,-123024474634060453,-2376195156280095240],1772499918 2118231989)

-- *Main System.Random> randomR (1,6) (mkStdGen 359353)
-- (6,1494289578 40692)
-- *Main System.Random> randomR (1,6) (mkStdGen 35935335)
-- (3,1250031057 40692)
-- *Main System.Random> take 10 $ randomRs ('a','z') (mkStdGen 3) :: [Char]
-- "ndkxbvmomg"

--- Randomness and I/O
-- see random_string.hs
-- see random_string2.hs
-- see random_string3.hs
-- see guess_the_number.hs
-- to be continued