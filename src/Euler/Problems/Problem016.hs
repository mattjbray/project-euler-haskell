module Euler.Problems.Problem016 where

import Data.Digits (digits)

import Euler.Lib.Solution (Solution(MkSolution))

sumDigits :: Integral a => a -> a
sumDigits = sum . digits 10

solve :: Solution
solve = MkSolution $ sumDigits num
  where
    num :: Integer
    num = 2 ^ (1000::Integer)
