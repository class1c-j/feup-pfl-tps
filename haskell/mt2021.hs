-- |
module Mt2021 where

maxpos :: [Int] -> Int
maxpos l = maxposAux (filter (> 0) l)

maxposAux :: [Int] -> Int
maxposAux [] = 0
maxposAux l = maximum l

dups :: [a] -> [a]
dups l = concat [if odd i then [l !! i] else l !! i : [l !! i] | i <- [0 .. length l - 1]]

transforma :: String -> String
transforma "" = ""
transforma (x : xs)
  | x == 'a' = "apa" ++ transforma xs
  | x == 'e' = "epe" ++ transforma xs
  | x == 'i' = "ipi" ++ transforma xs
  | x == 'o' = "opo" ++ transforma xs
  | x == 'u' = "upu" ++ transforma xs
  | otherwise = x : transforma xs

type Vector = [Int]

type Matriz = [[Int]]

transposta :: Matriz -> Matriz
transposta matrix = [[(matrix !! k) !! j | k <- [0 .. length matrix -1]] | j <- [0 .. length (head matrix) - 1]]

prodInterno :: Vector -> Vector -> Int
prodInterno u v = sum (zipWith (*) u v)

-- m(i,j) = a(i,j)
-- prodMat :: Matriz -> Matriz -> Matriz
-- prodMat a b =

data Arv a = F | N a (Arv a) (Arv a) deriving (Show)

alturas :: Arv a -> Arv Int
alturas F = F
alturas (N current left right) = N (altura (N current left right)) (alturas left) (alturas right)

altura :: Arv a -> Int
altura F = 0
altura (N current left right) = 1 + max (altura left) (altura right)

equilibrada :: Arv a -> Bool
equilibrada F = True
equilibrada (N current left right) = (altura left - altura right) <= 1 && equilibrada left && equilibrada right
