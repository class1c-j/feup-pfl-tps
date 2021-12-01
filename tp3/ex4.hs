import Data.List (insert)

isort :: Ord a => [a] -> [a]
isort = foldr insert []