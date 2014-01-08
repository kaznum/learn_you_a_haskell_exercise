--- Calculating RPN Expressions

--- Writing an RPN Function

solveRPN :: String -> Double
solveRPN = head . foldl foldingFunction [] . words
                      where foldingFunction (x:y:ys) "*" = (y * x):ys
                            foldingFunction (x:y:ys) "+" = (y + x):ys
                            foldingFunction (x:y:ys) "-" = (y - x):ys
                            foldingFunction xs numberString = read numberString:xs

-- *Main> solveRPN "10 4 3 + 2 * -"
-- -4.0
-- *Main> solveRPN "2 3.5 +"
-- 5.5
-- *Main> solveRPN "90 34 12 33 56 66 + * - +"
-- -3980.0
-- *Main> solveRPN "90 34 12 33 56 66 + * - + -"
-- 4070.0
-- *Main> solveRPN "90 3.8 -"
-- 86.2

--- Adding More Operators

-- to be continued
