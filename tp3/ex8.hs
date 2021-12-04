import Data.Char ( isSpace )
palavras :: String -> [String]
palavras [] = []
palavras str = takeWhile (not.isSpace) str : palavras (dropWhile isSpace (dropWhile (not.isSpace) str))

despalavras :: [String] -> String 
despalavras [] = []
despalavras [a] = a
despalavras (x:xs) = x ++ " " ++ despalavras xs