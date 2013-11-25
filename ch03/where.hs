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

-- to be continued
