-- ++
aux1 :: a -> [a] -> [a]
aux1 a l = l ++ [a]

aux2 :: [a] -> a -> [a]
aux2 l a = a : l

myConcatLists :: [a] -> [a] -> [a]
myConcatLists = foldr aux1

-- concat
myConcat :: [[a]] -> [a]
myConcat = foldr (++) []

-- reverse
myReverse :: [a] -> [a]
myReverse = foldr aux1 []

myReverse' :: [a] -> [a]
myReverse' = foldl aux2 []

-- elem
myElem :: Eq a => a -> [a] -> Bool
myElem a = any (==a)