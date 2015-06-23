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
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "Problem 1" $ do
    it "solves the given example" $ do
      sumMultiples 3 5 9 `shouldBe` 23

  describe "Problem 2" $ do
    it "generates Fibonnaci numbers" $ do
      -- we start at 0
      take 12 fibs `shouldBe` [0, 1 ,1 , 2, 3, 5, 8, 13, 21, 34, 55, 89]
    it "sums even fibs" $ do
      sumEvenFibsTo 90 `shouldBe` 2 + 8 + 34

  describe "Problem 3" $ do
    it "solves the given example" $ do
      largestPrimeFactor 13195 `shouldBe` 29

  describe "Problem 4" $ do
    it "solves the given example" $ do
      largestPalindromeProduct 10 99 `shouldBe` 9009

  describe "Problem 5" $ do
    it "solves the given example" $ do
      smallestEvenlyDivisibleByAllTo 10 `shouldBe` 2520

  describe "Problem 6" $ do
    it "solves the given example" $ do
      diffSquares [1..10] `shouldBe` 2640

  describe "Problem 7" $ do
    it "solves the given example" $ do
      primes !! 5 `shouldBe` 13

  describe "Problem 8" $ do
    it "solves the given example" $ do
      findLargestProductOfLength 4 `shouldBe` 5832

  describe "Problem 9" $ do
    it "solves an example" $ do
      head (productsWhereTrianglesSumTo 12) `shouldBe` 3 * 4 * 5

  describe "Problem 10" $ do
    it "solves the given example" $ do
      sumPrimesTo 10 `shouldBe` 17

  describe "Problem 11" $ do
    it "finds the largest product of four numbers at a given position" $ do
      largestAt 3 0 `shouldBe` maximum [97 * 38 * 15 * 0, 97 * 40 * 73 * 23, 19 * 17 * 79 * 11, 97 * 99 * 49 * 52]

  describe "Problem 12" $ do
    it "solves the given example" $ do
      firstTriangleWithNDivisors 5 `shouldBe` 28

  describe "Problem 14" $ do
    it "solves the given example" $ do
      collatz 13 `shouldBe` [13, 40, 20, 10, 5, 16, 8, 4, 2, 1]

  describe "Problem 15" $ do
    it "solves the given example" $ do
      routes 2 `shouldBe` 6
