maximum1 :: Ord a => [a] -> a
maximum1 = foldl1 max

minimum1 :: Ord a => [a] -> a
minimum1 = foldr1 min