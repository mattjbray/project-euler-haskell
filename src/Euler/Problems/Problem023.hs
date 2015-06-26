module Euler.Problems.Problem023 where

import Data.List.Ordered (member)

import Euler.Lib.Divisors (properDivisors)
import Euler.Lib.Solution (Solution(MkSolution))

data NumberType = Deficient | Perfect | Abundant
  deriving (Eq, Show)

numberType :: Integral a => a -> NumberType
numberType n = case sum (properDivisors n) `compare` n of
  LT -> Deficient
  EQ -> Perfect
  GT -> Abundant

isAbundant :: Integral a => a -> Bool
isAbundant n = numberType n == Abundant

abundants :: Integral a => [a]
abundants = filter isAbundant [1..]

isSumOfAbundants :: Integral a => a -> Bool
isSumOfAbundants n = or [ (n - i) `member` abundants | i <- takeWhile (<n) abundants ]

solve :: Solution
solve = MkSolution (sum (filter (not . isSumOfAbundants) [1..28123])::Integer)
