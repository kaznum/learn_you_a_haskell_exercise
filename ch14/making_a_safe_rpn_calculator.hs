import Control.Monad

-- *Main> :i ReadS
-- type ReadS a = String -> [(a, String)]
--   	-- Defined in `Text.ParserCombinators.ReadP'

readMaybe :: (Read a) => String -> Maybe a
readMaybe st = case reads st of
  [(x, "")] -> Just x
  _ -> Nothing

-- *Main> readMaybe "1" :: Maybe Int
-- Just 1
-- *Main> readMaybe "GOTO HELL" :: Maybe Int
-- Nothing

foldingFunction :: [Double] -> String -> Maybe [Double]
foldingFunction (x:y:ys) "*" = return ((y * x):ys)
foldingFunction (x:y:ys) "+" = return ((y + x):ys)
foldingFunction (x:y:ys) "-" = return ((y - x):ys)
foldingFunction xs numberString = liftM (:xs) (readMaybe numberString)

-- *Main> foldingFunction [3,2] "*"
-- Just [6.0]
-- *Main> foldingFunction [3,2] "-"
-- Just [-1.0]
-- *Main> foldingFunction [] "*"
-- Nothing
-- *Main> foldingFunction [] "1"
-- Just [1.0]
-- *Main> foldingFunction [] "1 wawawawawa"
-- Nothing

solveRPN :: String -> Maybe Double
solveRPN st = do
  [result] <- foldM foldingFunction [] (words st)
  return result

-- *Main> solveRPN "1 2 * 4 +"
-- Just 6.0
-- *Main> solveRPN "1 2 * 4 + 5 *"
-- Just 30.0
-- *Main> solveRPN "1 2 * 4"
-- Nothing
-- *Main> solveRPN "1 2 waweadfsf"
-- Nothing
