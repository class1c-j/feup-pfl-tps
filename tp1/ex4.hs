-- a

last' :: [a] -> a
last' l = head (reverse l)

last'' :: [a] -> a
last'' l = head (drop (length l - 1) l)

-- b

init' :: [a] -> [a]
init' l = take (length l - 1) l

init'' :: [a] -> [a]
init'' l = reverse (tail (reverse l))