module Euler.Problems.Problem010 where

import Euler.Lib.Primes (primesTo)

sumPrimesTo :: Int -> Int
sumPrimesTo = sum . primesTo

solve :: Int
solve = sumPrimesTo 2000000
