primos :: [Integer]
primos = crivo [2..]

crivo :: [Integer] -> [Integer]
crivo (p:xs) = p : crivo [x | x <- xs, mod x p /= 0]

factores :: Integer -> [Integer]
factores n = factores' n primos

factores' :: Integer -> [Integer] -> [Integer]
factores' 1 primos = []
factores' n primos = if mod n (head primos) == 0 then ((head primos) : factores' (div n (head primos)) primos) 
    else factores' n (tail primos)