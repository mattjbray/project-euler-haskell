import Data.List.Ordered (minus)

primes = sieve [2..]
  where sieve (p:xs) = p : sieve (xs `minus` [p*p, p*p+p..])

main = print $ primes !! 10000
