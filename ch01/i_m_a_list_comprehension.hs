[x*2 | x <- [1..10]]
[x*2 | x <- [1..10], x*2 >= 12]
[x | x <- [50..100], x `mod` 7 == 3]

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

boomBangs [7..13]

[x | x <- [10..20], x /= 13, x /= 15, x /= 19]

[x+y | x <- [1,2,3], y <- [10,100,100]]

[x*y | x <- [2,5,10], y <- [8,10,11]]
[x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]

let nouns = ["aa", "bb", "cc"]
let adjectives = ["lazy", "grouchy", "scheming"]
[adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]

let length' xs = sum [1 | _ <- xs]

let removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
removeNonUppercase "Hahaha! Ahaha!"
removeNonUppercase "IdontLIKEFROGS"

let xxs = [[1,3,5,2,3,1,2,4,5], [1,2,3,4,5,6,7,8,9], [1,2,4,2,1,6,3,1,3,2,3,6]]
[[ x | x <- xs, even x] | xs <- xxs]
