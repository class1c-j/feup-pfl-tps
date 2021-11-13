dotprod :: [Float] -> [Float] -> Float
dotprod u v = sum [x * y | (x, y) <- zip u v]