target = 600851475143

largestPrimeFactor target = go target 2 0
  where
    go target currentDivisor largestDivisor
      | target == currentDivisor = max currentDivisor largestDivisor
      | target `mod` currentDivisor == 0 = go (target `div` currentDivisor) 2 (max currentDivisor largestDivisor)
      | otherwise = go target (currentDivisor + 1) largestDivisor

main = print $ largestPrimeFactor target
