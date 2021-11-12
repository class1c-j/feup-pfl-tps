raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c = ((- b + sqrt discriminant) / (2 * a), (- b - sqrt discriminant) / (2 * a))
  where
    discriminant = b ^ 2 - 4 * a * c