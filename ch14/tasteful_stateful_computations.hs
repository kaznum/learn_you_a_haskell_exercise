import System.Random

threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen =
           let (firstCoin, newGen) = random gen
               (secondCoin, newGen') = random newGen
               (thirdCoin, newGen'') = random newGen'
           in (firstCoin, secondCoin, thirdCoin)


-- *Main> threeCoins (mkStdGen 152)
-- (True,True,False)

--- Stateful Computations

-- to be continued
