data Arv a = Vazia | No a (Arv a) (Arv a) deriving Show

sumArv :: Num a => Arv a -> a
sumArv Vazia = 0
sumArv (No a a1 a2) = sum [a, sumArv a1, sumArv a2]

