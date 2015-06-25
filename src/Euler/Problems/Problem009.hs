module Euler.Problems.Problem009 where

import Euler.Lib.Solution (Solution(MkSolution))

triangles :: [(Int, Int, Int)]
triangles = [(x, y, z) | x <- [1..], y <- [1..x], z <- [1..y], x*x == y*y + z*z]

productsWhereTrianglesSumTo :: Int -> [Int]
productsWhereTrianglesSumTo n = [x * y * z | (x, y, z) <- triangles, x + y + z == n]

solve :: Solution
solve = MkSolution $ head (productsWhereTrianglesSumTo 1000)
