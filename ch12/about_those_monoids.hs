-- *Main Control.Applicative> 4 * 1
-- 4
-- *Main Control.Applicative> 1 * 9
-- 9
-- *Main Control.Applicative> [1,2,3] ++ []
-- [1,2,3]
-- *Main Control.Applicative> [] ++ [0.5, 2.5]
-- [0.5,2.5]

-- '*' and '++' are  'associative'
-- *Main Control.Applicative> (3 * 2) * (8 * 5)
-- 240
-- *Main Control.Applicative> 3 * (2 * (8 * 5))
-- 240
-- *Main Control.Applicative> "la" ++ ("di" ++ "da")
-- "ladida"
-- *Main Control.Applicative> ("la" ++ "di") ++ "da"
-- "ladida"

-- but '-' is NOT 'associative'
-- *Main Control.Applicative> (5 - 3) - 4
-- -2
-- *Main Control.Applicative> 5 - (3 - 4)
-- 6

--- The Monoid Type Class

--- The Monoid Laws
