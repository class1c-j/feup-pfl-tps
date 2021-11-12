metades :: [a] -> ([a], [a])
metades l = (take halflen l, drop halflen l)
  where
    halflen = div (length l) 2