-- |
module HaskellTp3 where

-- 3.1
haskeliko :: (a -> b) -> [a] -> (a -> Bool) -> [b]
haskeliko f xs p = map f (filter p xs)

-- 3.2
dec2int :: [Int] -> Int
dec2int = foldl (\x y -> 10 * x + y) 0

-- 3.3
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] [] = []
zipWith' _ [] ly = error "Lists are not of the same size"
zipWith' _ lx [] = error "Lists are not of the same size"
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

-- 3.4

insert' :: Ord a => a -> [a] -> [a]
insert' e [] = [e]
insert' e (x : xs)
  | e >= x = x : insert' e xs
  | otherwise = e : (x : xs)

isort :: Ord a => [a] -> [a]
isort = foldr insert' []

-- 3.5
-- a
maximum' :: Ord a => [a] -> a
maximum' = foldl1 max

minimum' :: Ord a => [a] -> a
minimum' = foldl1 min

-- b
foldl1' :: (a -> a -> a) -> [a] -> a
foldl1' f l = foldl f (head l) (tail l)

foldr1' :: (a -> a -> a) -> [a] -> a
foldr1' f l = foldr f (last l) (init l)

-- 3.6
mdc :: Integral a => a -> a -> a
mdc a b = fst (until (\(a, b) -> b == 0) (\(a, b) -> (b, mod a b)) (a, b))

-- 3.7

-- aux functions
pushFront :: a -> [a] -> [a]
pushFront value l = value : l

pushBack :: a -> [a] -> [a]
pushBack value l = l ++ [value]

-- a
myPlusPlus :: [a] -> [a] -> [a]
myPlusPlus lx ly = foldr pushFront ly lx

-- b
myConcat :: [[a]] -> [a]
myConcat = foldr (++) []

-- c
myReverse :: [a] -> [a]
myReverse = foldr pushBack []

-- d
myReverseLeft :: [a] -> [a]
myReverseLeft = foldl (flip (:)) []

-- e
myElem :: Eq a => a -> [a] -> Bool
myElem e = any (== e)

-- 3.8

import Data.Char ( isSpace )
palavras :: String -> [String]
palavras [] = []
palavras str = takeWhile (not.isSpace) str : palavras (dropWhile isSpace (dropWhile (not.isSpace) str))

despalavras :: [String] -> String 
despalavras [] = []
despalavras [a] = a
despalavras (x:xs) = x ++ " " ++ despalavras xs

-- 3.9
scanl' :: (b -> a -> b) -> b -> [a] -> [b]
scanl' _ z [] = [z]
scanl' f z (x:xs) = z : scanl' f (f z x) xs

scanr' :: (a -> b -> b) -> b -> [a] -> [b]
scanr' _ z [] = [z]
scanr' f z (x:xs) = f x (head calculated) : calculated
    where calculated = scanr' f z xs