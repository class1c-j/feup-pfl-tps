-- a
aprox :: Int -> Double
aprox n = 4 * (1 + sum [fromIntegral ((-1) ^ k) / fromIntegral (2 * k + 1) | k <- [1 .. n]])

-- b
aprox' :: Int -> Double
aprox' n = sqrt (12 * (1 + sum [fromIntegral ((-1) ^ k) / fromIntegral ((k + 1) ^ 2) | k <- [1 .. n]]))