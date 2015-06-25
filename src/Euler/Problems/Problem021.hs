module Euler.Problems.Problem021 where

import Euler.Lib.Solution (Solution(MkSolution))

floorSqrt :: Int -> Int
floorSqrt n = floor $ sqrt (fromIntegral n :: Double)

properDivisors :: Int -> [Int]
properDivisors n = 1 : concat [[i, a] | i <- [2..floorSqrt n], let (a, b) = n `divMod` i, b == 0]

sumProperDivisors :: Int -> Int
sumProperDivisors = sum . properDivisors

isAmicable :: Int -> Bool
isAmicable a = db == a && a /= b
  where
    b = sumProperDivisors a
    db = sumProperDivisors b

solve :: Solution
solve = MkSolution $ sum (filter isAmicable [1..9999])
