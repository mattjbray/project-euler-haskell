module Euler.Problems.Problem004 where

digits :: Integral a => a -> [a]
digits 0 = []
digits x = digits (x `div` 10) ++ [x `mod` 10]

isPalindrome :: Eq a => [a] -> Bool
isPalindrome []     = True
isPalindrome [_]    = True
isPalindrome (x:xs) = x == last xs && isPalindrome (init xs)

largestPalindromeProduct :: Int -> Int -> Int
largestPalindromeProduct searchMin searchMax = maximum [x * y | x <- [searchMax,searchMax-1..searchMin], y <- [searchMax,searchMax-1..x], (isPalindrome . digits) (x * y)]

solve :: Int
solve = largestPalindromeProduct 100 999
