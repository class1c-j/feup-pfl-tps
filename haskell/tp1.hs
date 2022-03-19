-- |
module HaskellTp1 where

-- 1.1
testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c = a < b + c && b < a + c && c < a + b

-- 1.2
areaTriangulo :: Float -> Float -> Float -> Float
areaTriangulo a b c = sqrt (s * (s - a) * (s - b) * (s - c))
  where
    s = (a + b + c) / 2

-- 1.3
metades :: [a] -> ([a], [a])
metades l = (take cut l, drop cut l)
  where
    cut = div (length l) 2

-- 1.4
-- a
last' :: [a] -> a
last' l = head (drop cut l)
  where
    cut = length l - 1

-- b
init' :: [a] -> [a]
init' l = take cut l
  where
    cut = length l - 1

-- 1.5
-- a
binom :: Integer -> Integer -> Integer
binom n k = div (product [1 .. n]) (product [1 .. k] * product [1 .. n - k])

-- b
binom' :: Integer -> Integer -> Integer
binom' n k = div num denom
  where
    num = if k < n - k then product [n - k + 1 .. n] else product [k + 1 .. n]
    denom = if k < n - k then product [1 .. k] else product [1 .. n - k]

-- 1.6
raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c = ((- b + delta) / (2 * a), (- b - delta) / (2 * a))
  where
    delta = sqrt (b ^ 2 - 4 * a * c)

-- 1.7
-- a - [Char], String
-- b - (Char, Char, Char)
-- c - [(Bool, Char)]
-- d - ([Bool], [Char])
-- e - [[a] -> [a]]
-- f - [Bool -> Bool]

-- 1.8
-- a - segundo :: [a] -> a
-- b - trocar :: (a, b) -> (b, a)
-- c - par :: a -> b -> (a, b)
-- d - dobro :: (Num a) => a -> a
-- e - metade :: (Fractional a) => a -> a
-- f - minuscula :: Char -> Bool
-- g - intervalo :: (Ord a) => a -> a -> a -> Bool
-- h - palindromo :: (Eq a) => [a] -> Bool
-- i - twice :: (a -> a) -> a -> a

-- 1.9
classifica :: Int -> String
classifica n = if n <= 9 then "reprovado" else (if n <= 12 then "suficiente" else (if n <= 15 then "bom" else (if n <= 18 then "muito bom" else "muito bom com distinção")))

classifica' :: Int -> String
classifica' n
  | n <= 9 = "reprovado"
  | n <= 12 = "suficiente"
  | n <= 15 = "bom"
  | n <= 18 = "muito bom"
  | otherwise = "muito bom com distinção"

-- 1.10
classificaImc :: Float -> Float -> String
classificaImc w h
  | bmi < 18.5 = "baixo peso"
  | bmi < 25 = "peso normal"
  | bmi < 30 = "excesso de peso"
  | otherwise = "obesidade"
  where
    bmi = w / h ^ 2

-- 1.11
-- a
max3, min3 :: Ord a => a -> a -> a -> a
max3 x y z = if x >= y then (if x >= z then x else z) else (if y >= z then y else z)
min3 x y z = if x <= y then (if x <= z then x else z) else (if y <= z then y else z)

-- b
max3', min3' :: Ord a => a -> a -> a -> a
max3' x y z = max x (max y z)
min3' x y z = min x (min x z)

-- 1.12
xor' :: Bool -> Bool -> Bool
xor' True True = False
xor' False False = False
xor' _ _ = True

-- 1.13
safetail :: [a] -> [a]
safetail l = if null l then [] else tail l

safetail' :: [a] -> [a]
safetail' l
  | null l = []
  | otherwise = tail l

safetail'' :: [a] -> [a]
safetail'' [] = []
safetail'' l = tail l

-- 1.14
curta :: [a] -> Bool
curta l = length l <= 2

curta' :: [a] -> Bool
curta' [] = True
curta' [a] = True
curta' [a, b] = True
curta' _ = False

-- 1.15
-- a
mediana :: Ord a => a -> a -> a -> a
mediana a b c
  | (a <= b && a >= c) || (a >= b && a <= c) = a
  | (b <= a && b >= c) || (b >= a && b <= c) = b
  | otherwise = c

-- b
mediana' :: (Ord a, Num a) => a -> a -> a -> a
mediana' a b c = a + b + c - max3' a b c - min3' a b c

-- 1.16
converte :: Integral a => a -> String
converte 1000 = "mil"
converte n
  | n <= 0 = error "Null or negative number"
  | n >= 1000000 = error "Number is greater than 1000000"
  | n < 100 = converte100 n
  | n < 1000 = converte1000 n
  | otherwise = converte1000 (div n 1000) ++ " mil" ++ convertRest (mod n 1000)
  where
    convertRest rest = if rest == 0 then "" else (if rest <= 100 || mod rest 100 == 0 then " e " else " ") ++ converte1000 rest

converte100 :: Integral a => a -> String
converte100 1 = "um"
converte100 2 = "dois"
converte100 3 = "tres"
converte100 4 = "quatro"
converte100 5 = "cinco"
converte100 6 = "seis"
converte100 7 = "sete"
converte100 8 = "oito"
converte100 9 = "nove"
converte100 10 = "dez"
converte100 11 = "onze"
converte100 12 = "doze"
converte100 13 = "treze"
converte100 14 = "catorze"
converte100 15 = "quinze"
converte100 16 = "dezasseis"
converte100 17 = "dezassete"
converte100 18 = "dezoito"
converte100 19 = "dezanove"
converte100 20 = "vinte"
converte100 30 = "trinta"
converte100 40 = "quarenta"
converte100 50 = "cinquenta"
converte100 60 = "sessenta"
converte100 70 = "setenta"
converte100 80 = "oitenta"
converte100 90 = "noventa"
converte100 100 = "cem"
converte100 n
  | n <= 0 = error "Null or negative number"
  | n >= 100 = error "Number is greater than 100"
  | otherwise = converte100 (n - mod n 10) ++ " e " ++ converte100 (mod n 10)

converte1000 :: Integral a => a -> String
converte1000 100 = "cem"
converte1000 200 = "duzentos"
converte1000 300 = "trezentos"
converte1000 400 = "quatrocentos"
converte1000 500 = "quinhentos"
converte1000 600 = "seiscentos"
converte1000 700 = "setecentos"
converte1000 800 = "oitocentos"
converte1000 900 = "novecentos"
converte1000 n
  | n <= 0 = error "Null or negative number"
  | n >= 1000 = error "Number is greater than 1000"
  | n < 100 = converte100 n
  | div n 100 == 1 = "cento e " ++ converte100 (mod n 100)
  | otherwise = converte1000 (n - mod n 100) ++ " e " ++ converte100 (mod n 100)
