-- |
module HaskellTp4 where

-- 4.1
primos :: [Integer]
primos = crivo [2 ..]

crivo :: [Integer] -> [Integer]
crivo [] = []
crivo (p : xs) = p : crivo [x | x <- xs, mod x p /= 0]

-- 4.2
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

data Arv a = Vazia | No a (Arv a) (Arv a) deriving (Show)

-- 4.7
sumArv :: Num a => Arv a -> a
sumArv Vazia = 0
sumArv (No node left right) = node + sumArv left + sumArv right

-- 4.8
listar :: Arv a -> [a]
listar Vazia = []
listar (No node left right) = listar right ++ [node] ++ listar left

-- 4.9
nivel :: Int -> Arv a -> [a]
nivel _ Vazia = []
nivel 0 (No node _ _) = [node]
nivel n (No node left right) = nivel (n - 1) left ++ nivel (n - 1) right

-- 4.10
mapArv :: (a -> b) -> Arv a -> Arv b
mapArv f Vazia = Vazia
mapArv f (No node left right) = No (f node) (mapArv f left) (mapArv f right)

-- 4.11

-- inserção simples
inserir :: Ord a => a -> Arv a -> Arv a
inserir x Vazia = No x Vazia Vazia
inserir x (No node left right)
  | x == node = No node left right
  | x < node = No node (inserir x left) right
  | x > node = No node left (inserir x right)

construir :: Ord a => [a] -> Arv a
construir = foldr inserir Vazia

-- partição binária
construir' :: Ord a => [a] -> Arv a
construir' [] = Vazia
construir' (x : xs) = No x (construir' xs') (construir' xs'')
  where
    n = div (length xs) 2
    xs' = take n xs
    xs'' = drop n xs

altura :: (Num b, Ord b) => Arv a -> b
altura Vazia = 0
altura (No _ left right) = 1 + max (altura left) (altura right)

-- 4.12
--a
maisDir :: Arv a -> a
maisDir Vazia = error "Tree is empty"
maisDir (No x _ Vazia) = x
maisDir (No _ _ right) = maisDir right

--b
remover :: Ord a => a -> Arv a -> Arv a
remover _ Vazia = Vazia
remover x (No node Vazia right)
  | x == node = right
  | otherwise = remover node right
remover x (No node left Vazia)
  | x == node = left
  | otherwise = remover node left
remover x (No node left right)
  | x < node = No node (remover x left) right
  | x > node = No node left (remover x right)
  | x == node =
    let z = maisDir left
     in No z (remover z left) right
