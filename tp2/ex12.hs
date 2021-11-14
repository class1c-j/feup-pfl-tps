import Data.Char ( isDigit, isLower, isUpper )

forte :: String -> Bool
forte pass = length pass >= 8 && or [isLower x | x <- pass] && or [isUpper x | x <- pass] && or [isDigit x | x <- pass]