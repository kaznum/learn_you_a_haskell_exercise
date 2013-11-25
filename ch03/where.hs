bmiTell :: Double -> Double -> String
bmiTell weight height
  | bmi <= 18.5 = "You're underwight, you emo, you!"
  | bmi <= 25.0 = "You're supposedly normal."
  | bmi <= 30.0 = "You're fat"
  | otherwise = "You're whale, congrats!"
  where bmi = weight / height ^ 2

bmiTell' :: Double -> Double -> String
bmiTell' weight height
  | bmi <= skinny = "You're underwight, you emo, you!"
  | bmi <= normal = "You're supposedly normal."
  | bmi <= fat = "You're fat"
  | otherwise = "You're whale, congrats!"
  where bmi = weight / height ^ 2
        skinny = 18.5
        normal = 25.0
        fat = 30.0

--- where scope
-- greet :: String -> String
-- greet "Juan" = niceGreeting ++ " Juan!"
-- greet "Fernando" = niceGreeting ++ " Fernando!"
-- greet name = badGreeting ++ " " ++ name
--       where niceGreeting = "Hello! So very nice to see you,"
--             badGreeting = "Oh! Pfft. It's you."

badGreeting :: String
badGreeting = "Oh! Pfft. It's you."
niceGreeting :: String
niceGreeting = "Hello! So very nice to see you,"
greet :: String -> String
greet "Juan" = niceGreeting ++ " Juan!"
greet "Fernando" = niceGreeting ++ " Fernando!"
greet name = badGreeting ++ " " ++ name

--- Pattern Matching with where
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
         where (f:_) = firstname
               (l:_) = lastname

--- Functions in where Blocks
calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi w h | (w, h) <- xs]
         where bmi weight height = weight / height ^ 2
