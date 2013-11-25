-- The Eq Type Class
:t (==)
5 == 5
5 /= 5
'a' == 'a'
"Ho Ho" == "Ho Ho"
3.432 == 3.432


-- The Ord Type Class
:t (>)
"Abrakadabra" < "Zebra"
"Abrakadabra" `compare` "Zebra"
5 >= 2
5 `compare` 2
'b' > 'a'

-- The Show Type Class
show 3
show 5.334
show True


-- The Read Type Class
read "True" || False
read "8.2" + 3.8
read "5" - 2
read "[1,2,3,4]" ++ [3]
read "4"

:t read

--- type annotation
read "5" :: Int
read "5" :: Float
(read "5" :: Float) * 4
read "[1,2,3,4]" :: [Int]
read "(3, 'a')" :: (Int, Char)
[read "True", False, True, False]

-- The Enum Type Class
  ['a'..'e']
  [LT .. GT]
  [3 .. 5]
  succ 'B'

-- The Bounded Type Class
minBound :: Int
maxBound :: Char
maxBound :: Bool
minBound :: Bool
maxBound :: (Bool, Int, Char)

-- The Num Type Class
:t 20
20 :: Int
20 :: Integer
20 :: Float
20 :: Double

:t (*)
(5 :: Int) * (6 :: Integer)
5 * (6 :: Integer)

-- The Floating Type Class
:t sin
:t cos
:t sqrt

-- The Integral Type Class
:t fromIntegral
:t (fromIntegral 10)

length [1,2,3,4] + 3.2 -- error
fromIntegral (length [1,2,3,4]) + 3.2
