--- putStr
-- see putstr.hs

---  putChar
-- see putchar.hs

putStr' :: String -> IO ()
putStr' [] = return ()
putStr' (x:xs) = do
        putChar x
        putStr xs

--- print
-- see print.hs

-- hello*Main> 3
-- 3
-- *Main> print 3
-- 3
-- *Main> map (++"!") ["hey", "ho", "woo"]
-- ["hey!","ho!","woo!"]
-- *Main> print $ map (++"!") ["hey", "ho", "woo"]
-- ["hey!","ho!","woo!"]

--- when
-- see when.hs

--- sequence
-- see sequence.hs

-- *Main> sequence $ map print [1,2,3,4,5]
-- 1
-- 2
-- 3
-- 4
-- 5
-- [(),(),(),(),()]

--- mapM
-- *Main> mapM print [1,2,3]
-- 1
-- 2
-- 3
-- [(),(),()]
-- *Main> mapM_ print [1,2,3]
-- 1
-- 2
-- 3

--- forever
-- see forever.hs

--- forM
-- see for_m.hs

-- to be continued
