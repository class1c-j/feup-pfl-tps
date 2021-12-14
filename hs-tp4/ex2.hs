nums1 :: [Double]
nums1 = cycle [4, -4]

denoms1 :: [Double]
denoms1 = [1, 3 ..]

denoms2 :: [Double]
denoms2 = [x * (x + 1) * (x + 2) | x <- [2, 4 ..]]

calcPi1 :: Int -> Double
calcPi1 n = sum (zipWith (/) (take n nums1) (take n denoms1))

calcPi2 :: Int -> Double
calcPi2 n = 3 + sum (zipWith (/) (take n nums1) (take n denoms2))