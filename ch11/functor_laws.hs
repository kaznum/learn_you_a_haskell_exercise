--- Law 1

-- *Main> fmap id (Just 3)
-- Just 3
-- *Main> id (Just 3)
-- Just 3
-- *Main> fmap id [1..5]
-- [1,2,3,4,5]
-- *Main> id [1..5]
-- [1,2,3,4,5]
-- *Main> fmap id []
-- []
-- *Main> fmap id Nothing
-- Nothing

--- Law 2

--- Breaking the Law

data CMaybe a = CNothing | CJust Int a deriving (Show)
-- *Main> CNothing
-- CNothing
-- *Main> CJust 0 "haha"
-- CJust 0 "haha"
-- *Main> :t CNothing
-- CNothing :: CMaybe a
-- *Main> :t CJust 0 "haha"
-- CJust 0 "haha" :: CMaybe [Char]
-- *Main> CJust 100 [1,2,3]
-- CJust 100 [1,2,3]

instance Functor CMaybe where
  fmap f CNothing = CNothing
  fmap f (CJust counter x) = CJust (counter + 1) (f x)

-- *Main> fmap (++"ha") (CJust 0 "ho")
-- CJust 1 "hoha"
-- *Main> fmap (++"he") (fmap (++"ha") (CJust 0 "ho"))
-- CJust 2 "hohahe"
-- *Main> fmap (++ "blah") CNothing
-- CNothing
-- *Main> fmap id (CJust 0 "haha")
-- CJust 1 "haha"
-- *Main> id (CJust 0 "haha")
-- CJust 0 "haha"
-- *Main> fmap ((++"he") . (++"ha"))  (CJust 0 "ho")
-- CJust 1 "hohahe"

