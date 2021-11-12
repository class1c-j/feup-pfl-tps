unitText :: Int -> String
unitText n = ["um", "dois", "tres", "quatro", "cinco", "seis", "sete", "oito", "nove", "dez"] !! (n -1)

tensText :: Int -> String
tensText n = ["dez", "vinte", "trinta", "quarenta", "cinquenta", "sessenta", "setenta", "oitenta", "noventa"] !! (n -1)

hundredsText :: Int -> String
hundredsText n = ["cento", "duzentos", "trezentos", "quatrocentos", "quinhentos", "seiscentos", "setecentos", "oitocentos", "novecentos"] !! (n - 1)

differentText :: Int -> String
differentText n = ["onze", "doze", "treze", "catorze", "quinze", "dezasseis", "dezassete", "dezoito", "dezanove"] !! (n -1)

converteLessHundred :: Int -> String
converteLessHundred n
  | units == 0 = tensText tens
  | otherwise = tensText tens ++ " e " ++ unitText units
  where
    units = mod n 10
    tens = div n 10

converteLessThousand :: Int -> String
converteLessThousand n
  | remainder == 0 = converte hundreds
  | otherwise = hundredsText hundreds ++ " e " ++ converte remainder
  where
    hundreds = div n 100
    remainder = mod n 100

converteLessMillion :: Int -> String
converteLessMillion n
  | remainder == 0 = converte hundredThousands ++ " mil"
  | otherwise = converte hundredThousands ++ " mil " ++ converte remainder
  where
    remainder = mod n 1000
    hundredThousands = div n 1000

converte :: Int -> String
converte n
  | n < 10 = unitText n
  | n < 20 = differentText (n - 10)
  | n < 100 = converteLessHundred n
  | n == 100 = "cem"
  | n < 1000 = converteLessThousand n
  | n < 1000000 = converteLessMillion n
  | n == 1000000 = "one million"
  | otherwise = "Not supported"