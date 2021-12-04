scanl' :: (b -> a -> b) -> b -> [a] -> [b]
scanl' _ z [] = [z]
scanl' f z (x:xs) = z : scanl' f (f z x) xs

scanr' :: (a -> b -> b) -> b -> [a] -> [b]
scanr' _ z [] = [z]
scanr' f z (x:xs) = f x (head calculated) : calculated
    where calculated = scanr' f z xs