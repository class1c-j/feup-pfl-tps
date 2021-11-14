concat' :: [[a]] -> [a]
concat' l = [y | x <- l, y <- x]

replicate' :: Int -> a -> [a]
replicate' n elem = [elem | x <- [1 .. n]]

(??) :: [a] -> Int -> a
l ?? i = head [x | (x, n) <- zip l [0 .. length l - 1], n == i]