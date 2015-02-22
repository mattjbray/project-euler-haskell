module Euler.Problems.Problem006 where

sumSquares :: [Int] -> Int
sumSquares xs = sum (map (\ x -> x*x) xs)

squareSum :: [Int] -> Int
squareSum xs = let s = sum xs in s * s

diffSquares :: [Int] -> Int
diffSquares xs = squareSum xs - sumSquares xs

solve :: Int
solve = diffSquares [1..100]
