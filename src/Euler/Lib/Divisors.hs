module Euler.Lib.Divisors where

floorSqrt :: Int -> Int
floorSqrt n = floor $ sqrt (fromIntegral n :: Double)

properDivisors :: Int -> [Int]
properDivisors n = 1 : concat [[i, a] | i <- [2..floorSqrt n], let (a, b) = n `divMod` i, b == 0]
