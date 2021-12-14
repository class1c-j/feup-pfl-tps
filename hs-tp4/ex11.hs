data Arv a = Vazia | No a (Arv a) (Arv a) deriving (Show)

construir :: Ord a => [a] -> Arv a
construir = foldr inserir Vazia

construir' :: Ord a => [a] -> Arv a
construir' [] = Vazia
construir' (x : xs) = No x (construir' (take n xs)) (construir' (drop n xs))
  where
    n = div (length xs) 2

inserir :: Ord a => a -> Arv a -> Arv a
inserir a Vazia = No a Vazia Vazia
inserir a (No no esq dt)
  | a == no = No no esq dt
  | a < no = No no (inserir a esq) dt
  | a > no = No no esq (inserir a dt)

altura :: (Num b, Ord b) => Arv a -> b
altura Vazia = 0
altura (No _ l r) = 1 + max (altura l) (altura r)

comparaAlturas :: IO()
comparaAlturas = do
    comparaAlturasN 10
    comparaAlturasN 100
    comparaAlturasN 1000

comparaAlturasN :: (Integral a, Show a) => a -> IO()
comparaAlturasN n = do
    putStrLn $ "n= " ++ show n ++ ":"
    putStrLn $ "Por inserção simples: " ++ (show $ altura $ construir [1..n])
    putStrLn $ "Por inserção binária: " ++ (show $ altura $ construir' [1..n])