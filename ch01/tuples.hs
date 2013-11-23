(1,3)
(3, 'a', "hello")
(50, 50.4, "hello", 'b')
[[1,2],[3,4],[5,6]]
[[1,2],[3,4,5],[6,7]]
[(1,2),(3,4,5),(6,7)]
[(1,2),(3,4),(6,7)]

fst (4,5)
fst ("WoW", False)
snd (4,5)
snd ("WoW", False)

zip [1,2,3,4,5] [5,5,5,5,5]
zip [1..5] ["one", "two", "three", "four", "five"]

zip [3,4,3,2,5] ["im", "a", "turtle"]
zip [1..] ["apple", "orange", "cherry", "mango"]

let triples = [ (a, b, c) | c <- [1..10], a <- [1..10], b <- [1..10]]
let rightTriangles = [ (a, b, c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2 ]
let rightTriangles' = [ (a, b, c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2, a + b + c == 24 ]
