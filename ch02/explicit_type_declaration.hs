:t 'a'
  :t True
  :t "Hello!"
  :t (True, 'a')
  :t 4 == 5

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z
