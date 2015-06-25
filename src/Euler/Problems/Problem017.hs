module Euler.Problems.Problem017 where

import Data.Digits (digits, unDigits)

import Euler.Lib.Solution (Solution(MkSolution))

letterCount :: Int -> Int
letterCount 0  = 0
letterCount 1  = length "one"
letterCount 2  = length "two"
letterCount 3  = length "three"
letterCount 4  = length "four"
letterCount 5  = length "five"
letterCount 6  = length "six"
letterCount 7  = length "seven"
letterCount 8  = length "eight"
letterCount 9  = length "nine"
letterCount 10 = length "ten"
letterCount 11 = length "eleven"
letterCount 12 = length "twelve"
letterCount 13 = length "thirteen"
letterCount 14 = length "fourteen"
letterCount 15 = length "fifteen"
letterCount 16 = length "sixteen"
letterCount 17 = length "seventeen"
letterCount 18 = length "eighteen"
letterCount 19 = length "nineteen"
letterCount 20 = length "twenty"
letterCount 30 = length "thirty"
letterCount 40 = length "forty"
letterCount 50 = length "fifty"
letterCount 60 = length "sixty"
letterCount 70 = length "seventy"
letterCount 80 = length "eighty"
letterCount 90 = length "ninety"
letterCount n = case digits 10 n of
  [tens, units]       -> letterCount (tens * 10) + letterCount units
  [huns, tens, units] -> letterCount huns + length "hundred" + (if any (>0) [tens,units] then length "and" else 0) + letterCount (unDigits 10 [tens,units])
  [thous, huns, tens, units] -> letterCount thous + length "thousand" + letterCount (unDigits 10 [huns,tens,units])
  _ -> error $ "too many digits: " ++ show n

letterCountRange :: [Int] -> Int
letterCountRange = sum . map letterCount

solve :: Solution
solve = MkSolution $ letterCountRange [1..1000]
