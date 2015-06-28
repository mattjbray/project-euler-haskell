module Euler.Problems.Problem024 where

import Data.Digits (unDigits)
import Data.List (delete)

import Euler.Lib.Solution (Solution(MkSolution))

lexiPerms :: [Int] -> [[Int]]
lexiPerms [] = [[]]
lexiPerms xs = [x:ys | x <- xs, ys <- lexiPerms (delete x xs)]

solve :: Solution
solve = MkSolution $ unDigits 10 (lexiPerms [0..9] !! 999999)
