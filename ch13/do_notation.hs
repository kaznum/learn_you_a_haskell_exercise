-- *Main> Just 3 >>= (\x -> Just (show x ++ "!"))
-- Just "3!"

-- *Main> Just 3 >>= (\x -> Just "!" >>= (\y -> Just (show x ++ y)))
-- Just "3!"
-- *Main> let x = 3; y = "!" in show x ++ y
-- "3!"

-- *Main> Nothing >>= (\x -> Just "!" >>= (\y -> Just (show x ++ y)))
-- Nothing
-- *Main> Just 3 >>= (\x -> Nothing >>= (\y -> Just (show x ++ y)))
-- Nothing
-- *Main> Just 3 >>= (\x -> Just "!" >>= (\y -> Nothing))
-- Nothing

foo :: Maybe String
foo = Just 3 >>= (\x ->
                   Just "!" >>= (\y ->
                                  Just (show x ++ y)))
foo' :: Maybe String
foo' = do
  x <- Just 3
  y <- Just "!"
  return (show x ++ y)

--- Do As I Do

-- to be continued
