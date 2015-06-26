module Euler.Problems.Problem021 where

import Euler.Lib.Divisors (properDivisors)
import Euler.Lib.Solution (Solution(MkSolution))

sumProperDivisors :: Int -> Int
sumProperDivisors = sum . properDivisors

isAmicable :: Int -> Bool
isAmicable a = db == a && a /= b
  where
    b = sumProperDivisors a
    db = sumProperDivisors b

solve :: Solution
solve = MkSolution $ sum (filter isAmicable [1..9999])
