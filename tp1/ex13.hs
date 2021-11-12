-- condicionais
safetail :: [a] -> [a]
safetail l = if null l then [] else tail l

-- guardas
safetail' :: [a] -> [a]
safetail' l
  | null l = []
  | otherwise = tail l

-- padrões
safetail'' :: [a] -> [a]
safetail'' [] = []
safetail'' l = tail l