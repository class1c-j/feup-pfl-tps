-- a
curta :: [a] -> Bool
curta l 
  | length l <= 2 = True
  | otherwise = False

--b
curta' :: [a] -> Bool
curta' [] = True
curta' [_] = True
curta' [_,_] = True
curta' _ = False

----

evalList :: [a] -> String
evalList l
  | len <= 2 = "Curta"
  | len <= 4 = "Media"
  | otherwise = "Comprida"
  where len = length l