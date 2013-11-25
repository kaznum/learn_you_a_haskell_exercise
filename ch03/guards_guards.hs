bmiTell :: Double -> String
bmiTell bmi
  | bmi <= 18.5 = "You're underwight, you emo, you!"
  | bmi <= 25.0 = "You're supposedly normal."
  | bmi <= 30.0 = "You're fat"
  | otherwise = "You're whale, congrats!"

bmiTell' :: Double -> Double -> String
bmiTell' weight height
  | weight / height ^ 2 <= 18.5 = "You're underwight, you emo, you!"
  | weight / height ^ 2 <= 25.0 = "You're supposedly normal."
  | weight / height ^ 2 <= 30.0 = "You're fat"
  | otherwise = "You're whale, congrats!"

max' :: (Ord a) => a -> a -> a
max' a b
  | a <= b = b
  | otherwise = a

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
  | a == b = EQ
  | a <= b = LT
  | otherwise = GT

-- 3 `myCompare` 2