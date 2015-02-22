module Euler.Lib.Primes (primes, primesTo) where

import Data.List.Ordered (minus)

primes :: [Int]
primes = sieve [2..]
  where
    sieve [] = []
    sieve (p:xs) = p : sieve (xs `minus` [p*p, p*p+p..])

-- primesTo m = takeWhile (< m) primes
primesTo :: Int -> [Int]
primesTo m = 2 : sieve [3,5..m]
  where
    sieve [] = []
    sieve (p:xs)
      | p*p > m = p : xs
      | otherwise = p : sieve (xs `minus` [p*p, p*p+2*p..])
