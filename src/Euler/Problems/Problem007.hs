module Euler.Problems.Problem007 where

import Euler.Lib.Primes (primes)
import Euler.Lib.Solution (Solution(MkSolution))

solve :: Solution
solve = MkSolution $ primes !! 10000
