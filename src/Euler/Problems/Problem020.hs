module Euler.Problems.Problem020 where

import Data.Digits (digits)

import Euler.Lib.Solution (Solution(MkSolution))

sumFactDigits :: Integral a => a -> a
sumFactDigits n = sum (digits 10 (product [1..n]))

solve :: Solution
solve = MkSolution $ sumFactDigits (100::Integer)
