--- Left Identity

-- *Main Control.Monad> return 3 >>= (\x -> Just (x+100000))
-- Just 100003
-- *Main Control.Monad> (\x -> Just (x+100000)) 3
-- Just 100003

-- *Main Control.Monad> return "WoM" >>= (\x -> [x,x,x])
-- ["WoM","WoM","WoM"]
-- *Main Control.Monad> (\x -> [x,x,x]) "WoW"
-- ["WoW","WoW","WoW"]

--- Right Identity
-- *Main Control.Applicative> Just "move on up" >>= (\x -> return x)
-- Just "move on up"
-- *Main Control.Applicative> [1,2,3,4] >>= (\x -> return x)
-- [1,2,3,4]
-- *Main Control.Applicative> putStrLn "Wah!" >>= (\x -> return x)
-- Wah!
-- *Main Control.Applicative> :t putStrLn
-- putStrLn :: String -> IO ()

--- Associativity


-- to be continued
