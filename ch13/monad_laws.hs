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


-- to be continued
