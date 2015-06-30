module Euler.Lib.Fibonacci where

fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
