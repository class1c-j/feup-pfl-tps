-- 5.1
maximum1 :: Ord a => [a] -> a
maximum1 = foldl1 max

minimum1 :: Ord a => [a] -> a
minimum1 = foldr1 min

-- 5.2
myFoldl1 :: (a -> a -> a) -> [a] -> a
myFoldl1 f l = foldl f (head l) (tail l)


myFoldr1 :: (a -> a -> a) -> [a] -> a
myFoldr1 f l = foldr f (last l) (init l)