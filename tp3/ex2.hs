dec2int :: [Int] -> Int
dec2int = foldl (\acc x -> 10 * acc + x) 0