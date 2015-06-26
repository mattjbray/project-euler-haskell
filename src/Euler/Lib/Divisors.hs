module Euler.Lib.Divisors where

floorSqrt :: (Integral a) => a -> a
floorSqrt n = floor $ sqrt (fromIntegral n :: Double)

properDivisors :: (Integral a) => a -> [a]
properDivisors n = 1 : concat [ if i == a then [i] else [i, a]
                              | i <- [2..floorSqrt n]
                              , let (a, b) = n `divMod` i
                              , b == 0
                              ]
