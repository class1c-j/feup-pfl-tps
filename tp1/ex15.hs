mediana :: Ord a => a -> a -> a -> a
mediana a b c 
  | (a <= b && a >= c) || (a >= b && a <= c) = a
  | (b <= a && b >= c) || (b >= a && b <= c) = b
  | otherwise = c

mediana' :: (Ord a, Num a) => a -> a -> a -> a
mediana' a b c = sum [a, b, c] - max (max a b) c - min (min a b) c  