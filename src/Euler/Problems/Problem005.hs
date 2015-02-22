module Euler.Problems.Problem005 where

nonFactorsOf :: Int -> [Int]
nonFactorsOf n = [x | x <- [2..n], n `mod` x /= 0]

isEvenlyDivisibleByAllTo :: Int -> Int -> Bool
isEvenlyDivisibleByAllTo n a = all (\ x -> a `mod` x == 0) toTest
  where
    toTest :: [Int]
    toTest = n : (reverse (nonFactorsOf n))

smallestEvenlyDivisibleByAllTo :: Int -> Int
smallestEvenlyDivisibleByAllTo n = head [x | x <- [n,2 * n..], isEvenlyDivisibleByAllTo n x]

solve :: Int
solve = smallestEvenlyDivisibleByAllTo 20
