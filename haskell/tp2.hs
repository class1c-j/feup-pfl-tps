-- |
module HaskellTp2 where

import Data.Char (isAsciiUpper)

-- 2.1
squareSum :: Integer
squareSum = sum [x ^ 2 | x <- [1 .. 100]]

-- 2.2
-- a
aprox :: Int -> Double
aprox n = 4 * sum [fromIntegral ((-1) ^ k) / fromIntegral (2 * k + 1) | k <- [0 .. n]]

-- b
aprox' :: Int -> Double
aprox' n = sqrt (12 * sum [fromIntegral ((-1) ^ k) / fromIntegral ((k + 1) ^ 2) | k <- [0 .. n]])

-- 2.3
dotprod :: [Float] -> [Float] -> Float
dotprod u v = sum [a * b | (a, b) <- zip u v]

-- 2.4
divprop :: Integer -> [Integer]
divprop n = [div | div <- [1 .. n -1], mod n div == 0]

-- 2.5
perfeitos :: Integer -> [Integer]
perfeitos n = [perf | perf <- [1 .. n], perf == sum (divprop perf)]

-- 2.6
pitagoricos :: Integer -> [(Integer, Integer, Integer)]
pitagoricos n = [(a, b, c) | a <- [1 .. n], b <- [1 .. n], c <- [1 .. n], a ^ 2 + b ^ 2 == c ^ 2]

-- 2.7
primo :: Integer -> Bool
primo n = length (divprop n) == 1

-- 2.8
binom :: Integer -> Integer -> Integer
binom n k = div num denom
  where
    num = if k < n - k then product [n - k + 1 .. n] else product [k + 1 .. n]
    denom = if k < n - k then product [1 .. k] else product [1 .. n - k]

pascal :: Integer -> [[Integer]]
pascal 0 = [linha 0]
pascal n = pascal (n -1) ++ [linha n]

linha :: Integer -> [Integer]
linha n = [binom n k | k <- [0 .. n]]

-- 2.9
cifrar :: Int -> String -> String
cifrar n = map (cifra n)

cifra :: Int -> Char -> Char
cifra n char
  | isAsciiUpper char = toEnum newChar
  | otherwise = char
  where
    base = fromEnum 'A'
    newChar = mod (fromEnum char - base + n) 26 + base

-- 2.10
-- a
myand :: [Bool] -> Bool
myand [] = True
myand (x : xs) = x && myand xs

-- b
myor :: [Bool] -> Bool
myor [] = False
myor (x : xs) = x || myor xs

-- 2.11
concat' :: [[a]] -> [a]
concat' l = [y | x <- l, y <- x]

replicate' :: Int -> a -> [a]
replicate' n elem = [elem | x <- [1 .. n]]

(??) :: [a] -> Int -> a
l ?? i = head [x | (x, n) <- zip l [0 .. length l - 1], n == i]

-- 2.12
import Data.Char ( isDigit, isLower, isUpper )

forte :: String -> Bool
forte pass = length pass >= 8 && or [isLower x | x <- pass] && or [isUpper x | x <- pass] && or [isDigit x | x <- pass]

-- 2.20
-- a
insert' :: Ord a => a -> [a] -> [a]
insert' e [] = [e]
insert' e (x : xs)
  | e >= x = x : insert' e xs
  | otherwise = e : (x : xs)

-- b
isort :: Ord a => [a] -> [a]
isort [] = []
isort (x : xs) = insert' x (isort xs)
