module Euler.Problems.Problem012 where

import Data.List (mapAccumL)

import Euler.Lib.Solution (Solution(MkSolution))

triangles :: [Int]
triangles = snd $ mapAccumL (\ acc x -> (acc + x, acc + x)) 0 [1..]

factorsOf :: Int -> [Int]
factorsOf n = concat [[x, n `div` x] | x <- takeWhile (< limit) [1..], n `mod` x == 0]
  where
    limit :: Int
    limit = (ceiling . sqrt . (fromIntegral :: Int -> Double)) n

firstTriangleWithNDivisors :: Int -> Int
firstTriangleWithNDivisors n = head [x | x <- triangles, length (factorsOf x) > n]

solve :: Solution
solve = MkSolution $ firstTriangleWithNDivisors 500
