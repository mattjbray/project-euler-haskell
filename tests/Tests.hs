module Main where

import Euler.Lib.Primes (primes)
import Euler.Problems.Problem001 (sumMultiples)
import Euler.Problems.Problem002 (fibs, sumEvenFibsTo)
import Euler.Problems.Problem003 (largestPrimeFactor)
import Euler.Problems.Problem004 (largestPalindromeProduct)
import Euler.Problems.Problem005 (smallestEvenlyDivisibleByAllTo)
import Euler.Problems.Problem006 (diffSquares)
import Euler.Problems.Problem008 (findLargestProductOfLength)
import Euler.Problems.Problem009 (productsWhereTrianglesSumTo)
import Euler.Problems.Problem010 (sumPrimesTo)
import Euler.Problems.Problem011 (largestAt)
import Euler.Problems.Problem012 (firstTriangleWithNDivisors)
import Euler.Problems.Problem014 (collatz)
import Euler.Problems.Problem015 (routes)
import Euler.Problems.Problem016 (sumDigits)
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "Problem 1" $
    it "solves the given example" $
      sumMultiples 3 5 9 `shouldBe` 23

  describe "Problem 2" $ do
    it "generates Fibonnaci numbers" $
      -- we start at 0
      take 12 fibs `shouldBe` [0, 1 ,1 , 2, 3, 5, 8, 13, 21, 34, 55, 89]
    it "sums even fibs" $
      sumEvenFibsTo 90 `shouldBe` 2 + 8 + 34

  describe "Problem 3" $
    it "solves the given example" $
      largestPrimeFactor 13195 `shouldBe` 29

  describe "Problem 4" $
    it "solves the given example" $
      largestPalindromeProduct 10 99 `shouldBe` 9009

  describe "Problem 5" $
    it "solves the given example" $
      smallestEvenlyDivisibleByAllTo 10 `shouldBe` 2520

  describe "Problem 6" $
    it "solves the given example" $
      diffSquares [1..10] `shouldBe` 2640

  describe "Problem 7" $
    it "solves the given example" $
      primes !! 5 `shouldBe` 13

  describe "Problem 8" $
    it "solves the given example" $
      findLargestProductOfLength 4 `shouldBe` 5832

  describe "Problem 9" $
    it "solves an example" $
      head (productsWhereTrianglesSumTo 12) `shouldBe` 3 * 4 * 5

  describe "Problem 10" $
    it "solves the given example" $
      sumPrimesTo 10 `shouldBe` 17

  describe "Problem 11" $
    it "finds the largest product of four numbers at a given position" $
      largestAt 3 0 `shouldBe` maximum [97 * 38 * 15 * 0, 97 * 40 * 73 * 23, 19 * 17 * 79 * 11, 97 * 99 * 49 * 52]

  describe "Problem 12" $
    it "solves the given example" $
      firstTriangleWithNDivisors 5 `shouldBe` 28

  describe "Problem 14" $
    it "solves the given example" $
      collatz 13 `shouldBe` [13, 40, 20, 10, 5, 16, 8, 4, 2, 1]

  describe "Problem 15" $
    it "solves the given example" $
      routes 2 `shouldBe` 6

  describe "Problem 16" $
    it "solves the given example" $
      sumDigits ((2::Integer) ^ (15::Integer)) `shouldBe` 26
