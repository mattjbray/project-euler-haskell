module Euler.Problems.Problem003 where

largestPrimeFactor :: Int -> Int
largestPrimeFactor n = go n 2 0
  where
    go x currentDivisor largestDivisor
      | x == currentDivisor = max currentDivisor largestDivisor
      | x `mod` currentDivisor == 0 = go (x `div` currentDivisor) 2 (max currentDivisor largestDivisor)
      | otherwise = go x (currentDivisor + 1) largestDivisor

solve :: Int
solve = largestPrimeFactor 600851475143
