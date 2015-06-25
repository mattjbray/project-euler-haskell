module Euler.Problems.Problem015 where

import Euler.Lib.Solution (Solution(MkSolution))

routes :: Int -> Int
routes n = routesInto n n

routesInto :: Int -> Int -> Int
routesInto = (!!) . (!!) (map (\x -> map (f x) [0..]) [0..])
  where
    f 0 0 = 0
    f 0 _ = 1
    f _ 0 = 1
    f x y = routesInto x (y-1) + routesInto (x-1) y

solve :: Solution
solve = MkSolution $ routes 20
