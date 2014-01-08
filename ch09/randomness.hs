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

-- to be continued