module Euler.Problems.Problem002 where

import Euler.Lib.Solution (Solution(MkSolution))

fibs :: [Int]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

sumEvenFibsTo :: Int -> Int
sumEvenFibsTo n = sum [x | x <- takeWhile (< n) fibs, x `mod` 2 == 0]

solve :: Solution
solve = MkSolution $ sumEvenFibsTo 4000000
