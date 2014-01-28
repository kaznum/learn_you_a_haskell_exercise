isBigGang :: Int -> Bool
isBigGang x = x > 9

-- *Main> isBigGang 3
-- False
-- *Main> isBigGang 10
-- True

isBigGang' :: Int -> (Bool, String)
isBigGang' x = (x > 9, "Compared gang size to 9.")

-- *Main> isBigGang' 3
-- (False,"Compared gang size to 9.")
-- *Main> isBigGang' 30
-- (True,"Compared gang size to 9.")

applyLog :: (a, String) -> (a -> (b, String)) -> (b, String)
applyLog (x, log) f = let (y, newlog) = f x in (y, log ++ newlog)

-- *Main> (3, "Smallish gang.") `applyLog` isBigGang'
-- (False,"Smallish gang.Compared gang size to 9.")
-- *Main> (30, "A freaking platoon.") `applyLog` isBigGang'
-- (True,"A freaking platoon.Compared gang size to 9.")

-- *Main> ("Tobin", "Got outlaw name.") `applyLog` (\x -> (length x, "Apply length."))
-- (5,"Got outlaw name.Apply length.")
-- *Main> ("Bathcat", "Got outlaw name.") `applyLog` (\x -> (length x, "Apply length."))
-- (7,"Got outlaw name.Apply length.")

--- Monoids to the Rescue

-- to be continued
