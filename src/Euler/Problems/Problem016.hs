module Euler.Problems.Problem016 where

import Data.Digits (digits)

sumDigits :: Integral a => a -> a
sumDigits = sum . digits 10

solve :: Int
solve = fromIntegral $ sumDigits num
  where
    num :: Integer
    num = 2 ^ (1000::Integer)
