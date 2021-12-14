classifica :: Float -> Float -> String 
classifica weight height 
  | imc < 18.5 = "baixo peso"
  | imc < 25 = "peso normal"
  | imc < 30 = "excesso de peso"
  | otherwise = "obesidade"
  where imc = weight / height ^ 2