module Euler.Problems.Problem025 where

import Data.Digits (digits)
import Data.List (mapAccumL)

import Euler.Lib.Fibonacci (fibs)
import Euler.Lib.Solution (Solution(MkSolution))

listWithIndex :: [a] -> [(Int, a)]
listWithIndex xs = snd $ mapAccumL (\i x -> (i+1, (i, x))) 0 xs

firstWithNDigits :: Integral a => Int -> [a] -> Int
firstWithNDigits n = fst . head . dropWhile (\(_, ds) -> ds<n) . listWithIndex . map (length . digits 10)

solve :: Solution
solve = MkSolution $ firstWithNDigits 1000 fibs
