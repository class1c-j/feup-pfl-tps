areaTriangulo :: Double -> Double -> Double -> Double
areaTriangulo a b c = sqrt (s * (s - a) * (s - b) * (s - c))
  where
    s = (a + b + c) / 2