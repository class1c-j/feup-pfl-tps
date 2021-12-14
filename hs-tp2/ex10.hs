myand :: [Bool] -> Bool
myand [] = True
myand (x : xs) = x && myand xs

myor :: [Bool] -> Bool
myor [] = False
myor (x : xs) = x || myor xs

myconcat :: [[a]] -> [a]
myconcat [] = []
myconcat (x : xs) = x ++ myconcat xs

myreplicate :: Int -> a -> [a]
myreplicate 0 _ = []
myreplicate n x = x : myreplicate (n -1) x

(@@) :: [a] -> Int -> a
[] @@ _ = error "Invalid index"
(x : _) @@ 0 = x
(_ : xs) @@ n = xs @@ (n -1)

myelem :: Eq a => a -> [a] -> Bool 
myelem _ [] = False 
myelem e (x : xs) = e == x || myelem e xs 
