-- if then else
five :: (Eq a, Num a) => a -> [Char]
five n = if (n == 5) then "five" else "not false"

-- guard
five' :: (Eq a, Num a) => a -> [Char]
five' n
  | n == 5 = "five"
  | otherwise = "not five"

-- pattern matching
five'' :: (Eq a, Num a) => a -> [Char]
five'' 5 = "five"
five'' _ = "not five"

-- case
five''' :: (Eq a, Num a) => a -> [Char]
five''' n = case n of
  5 -> "five"
  _ -> "not five"