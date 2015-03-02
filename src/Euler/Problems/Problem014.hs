module Euler.Problems.Problem014 where

import Data.Function
import Data.List

next :: Int -> Int
next n
  | even n    = n `div` 2
  | otherwise = 3 * n + 1

collatz :: Int -> [Int]
collatz n
  | n == 1    = [1]
  | otherwise = n : collatz (next n)

nWithLongestChainUnder :: Int -> Int
nWithLongestChainUnder n = fst $ maximumBy (compare `on` snd) $ (map (\i -> (i, length (collatz i))) [1..n])

solve :: Int
solve = nWithLongestChainUnder 1000000
