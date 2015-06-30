module Euler.Problems.Problem002 where

import Euler.Lib.Fibonacci (fibs)
import Euler.Lib.Solution (Solution(MkSolution))

sumEvenFibsTo :: Integer -> Integer
sumEvenFibsTo n = sum [x | x <- takeWhile (< n) fibs, x `mod` 2 == 0]

solve :: Solution
solve = MkSolution $ sumEvenFibsTo 4000000
