import Data.Char (chr, ord)

cifrar :: Int -> String -> String
cifrar k phrase = [if x == ' ' then ' ' else chr (mod (ord x - ord 'a' + k) 26 + ord 'a') | x <- phrase]
