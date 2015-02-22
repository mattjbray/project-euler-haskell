module Euler.Problems.Problem001 where

solve :: Int
solve = sumMultiples 3 5 999

sumMultiples :: Int -> Int -> Int -> Int
sumMultiples a b n = sum [x | x <- [1..n], x `mod` a == 0 || x `mod` b == 0]
