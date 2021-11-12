
-- a
binom :: Integer -> Integer -> Integer
binom n k = div (product [1 .. n]) (product [1 .. k] * product [1 .. n - k])

-- b
binom' :: Integer -> Integer -> Integer 
binom' n k = div (if k < n - k then product [n-k+1..n] else product [k+1..n]) (if k < n - k then product [1..k] else product [1..n-k])