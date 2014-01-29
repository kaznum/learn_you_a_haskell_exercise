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
stackyStack :: State Stack ()
stackyStack = do
  stackNow <- get
  if stackNow == [1,2,3]
    then put [8,3,1]
    else put [9,2,1]

-- *Main> runState stackyStack [1,2,3,4,5]
-- ((),[9,2,1])
-- *Main> runState stackyStack [1,2,3]
-- ((),[8,3,1])

pop'' :: State Stack Int
pop'' = do
  (x:xs) <- get
  put xs
  return x

push'' :: Int -> State Stack ()
push'' x = do
  xs <- get
  put (x:xs)

sampleManip :: State Stack ()
sampleManip = do
  a <- pop''
  if a == 5
    then push'' 5
    else do
      push'' 3
      push'' 8

-- *Main> runState  sampleManip [1,2,3]
-- ((),[8,3,2,3])
-- *Main> runState  sampleManip [5,2,3]
-- ((),[5,2,3])

--- Randomness and the State Monad
randomSt :: (RandomGen g, Random a) => State g a
randomSt = state random

threeCoins' :: State StdGen (Bool, Bool, Bool)
threeCoins' = do
  a <- randomSt
  b <- randomSt
  c <- randomSt
  return (a, b, c)

-- *Main> runState threeCoins' (mkStdGen 33)
-- ((True,False,True),680029187 2103410263)
