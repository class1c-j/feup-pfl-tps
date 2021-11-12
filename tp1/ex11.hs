-- a
max3, min3 :: Ord a => a -> a -> a -> a
max3 x y z
  | x >= y = if x >= z then x else z
  | y >= z = y
  | otherwise = z
min3 x y z
  | x <= y = if x <= z then x else z
  | y <= z = y
  | otherwise = z


-- b
max3', min3' :: Ord a => a -> a -> a -> a
max3' x y = max (max x y)
min3' x y = min (min x y)
