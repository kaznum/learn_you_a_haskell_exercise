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

--- Stacks and Stones
type Stack = [Int]

pop :: Stack -> (Int, Stack)
pop (x:xs) = (x, xs)

push :: Int -> Stack -> ((), Stack)
push a xs = ((), a:xs)

stackManip :: Stack -> (Int, Stack)
stackManip stack = let
           ((), newStack1) = push 3 stack
           (a, newStack2) = pop newStack1
           in pop newStack2

-- *Main> stackManip [5,8,2,1]
-- (5,[8,2,1])

--- The State Monad

-- to be continued
