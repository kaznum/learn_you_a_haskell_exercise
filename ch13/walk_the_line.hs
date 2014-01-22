--- Code, Code, Code
type Birds = Int
type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Pole
landLeft n (left, right) = (left + n, right)

landRight :: Birds -> Pole -> Pole
landRight n (left, right) = (left, right + n)

-- *Main> landLeft 2 (0,0)
-- (2,0)
-- *Main> landRight 1 (0,0)
-- (0,1)
-- *Main> landRight (-1) (1,2)
-- (1,1)
-- *Main> landLeft 2 (landRight 1 (landLeft 1 (0, 0)))
-- (3,1)

x -: f = f x
-- *Main> 100 -: (*3)
-- 300
-- *Main> True -: not
-- False
-- *Main> (0, 0) -: landLeft 2
-- (2,0)
-- *Main> (0, 0) -: landLeft 1 -: landRight 1 -: landLeft 2
-- (3,1)

--- I'll Fly Away
-- *Main> landLeft 10 (0,3)
-- (10,3)

-- *Main> (0, 0) -: landLeft 1 -: landRight 4 -: landLeft (-1) -: landRight (-2)
-- (0,2)


landLeft' :: Birds -> Pole -> Maybe Pole
landLeft' n (left, right)
  | abs ((left + n) - right) < 4 = Just (left + n, right)
  | otherwise = Nothing

landRight' :: Birds -> Pole -> Maybe Pole
landRight' n (left, right)
  | abs (left - (right + n)) < 4 = Just (left, right + n)
  | otherwise = Nothing

-- *Main> landLeft' 2 (0, 0)
-- Just (2,0)
-- *Main> landLeft' 10 (0, 0)
-- Nothing

-- *Main> landLeft' 1 (landRight' 1 (0, 0))
-- <interactive>:81:14:
--     Couldn't match type `Maybe Pole' with `(Birds, Birds)'
--     Expected type: Pole
--       Actual type: Maybe Pole
--     In the return type of a call of landRight'
--     In the second argument of landLeft', namely `(landRight' 1 (0, 0))'
--     In the expression: landLeft' 1 (landRight' 1 (0, 0))


-- *Main> landRight' 1 (0,0) >>= landLeft' 2
-- Just (2,1)

-- *Main> Nothing >>= landLeft' 2
-- Nothing
-- *Main> return (0, 0) >>= landRight' 2 >>= landLeft' 2 >>= landRight' 2
-- Just (2,4)

-- *Main> return (0, 0) >>= landLeft' 1 >>= landRight' 4 >>= landLeft' (-1) >>= landRight' (-2)
-- Nothing

--- Banana on a Wire
banana :: Pole -> Maybe Pole
banana _ = Nothing

-- *Main> return (0, 0) >>= landLeft' 1 >>= banana >>= landRight' 1
-- Nothing

-- *Main> Nothing >> Just 3
-- Nothing
-- *Main> Just 2 >> Just 3
-- Just 3
-- *Main> Just 3 >> Nothing
-- Nothing

-- *Main> return (0, 0) >>= landLeft' 1 >> Nothing >>= landRight' 1
-- Nothing
