import System.Random
import Control.Monad.State

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

pop' :: Stack -> (Int, Stack)
pop' (x:xs) = (x, xs)

push' :: Int -> Stack -> ((), Stack)
push' a xs = ((), a:xs)

stackManip :: Stack -> (Int, Stack)
stackManip stack = let
           ((), newStack1) = push' 3 stack
           (a, newStack2) = pop' newStack1
           in pop' newStack2

-- *Main> stackManip [5,8,2,1]
-- (5,[8,2,1])

pop :: State Stack Int
pop = state $ \(x:xs) -> (x, xs)
push :: Int -> State Stack ()
push a = state $ \xs -> ((), a:xs)

--- The State Monad
stackManip' :: State Stack Int
stackManip' = do
  push 3
  a <- pop
  pop

-- *Main> runState stackManip' [5,8,2,1]
-- (5,[8,2,1])

stackManip'' :: State Stack Int
stackManip'' = do
  push 3
  pop
  pop

-- *Main> runState stackManip'' [5,8,2,1]
-- (5,[8,2,1])

stackStuff :: State Stack ()
stackStuff = do
  a <- pop
  if a == 5
    then push 5
    else do
      push 3
      push 8

-- *Main> runState stackStuff [9,0,2,1,0]
-- ((),[8,3,0,2,1,0])

moreStack :: State Stack ()
moreStack = do
  a <- stackManip''
  if a == 100
    then stackStuff
    else return ()

-- *Main> runState moreStack [9,0,2,1,0]
-- ((),[0,2,1,0])
-- *Main> runState moreStack [100,0,2,1,0]
-- ((),[8,3,2,1,0])

--- Getting and Setting State

-- to be continued
