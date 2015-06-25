module Euler.Problems.Problem010 where

import Euler.Lib.Primes (primesTo)
import Euler.Lib.Solution (Solution(MkSolution))

sumPrimesTo :: Int -> Int
sumPrimesTo = sum . primesTo

solve :: Solution
solve = MkSolution $ sumPrimesTo 2000000
