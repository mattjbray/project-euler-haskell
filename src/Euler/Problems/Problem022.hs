module Euler.Problems.Problem022 where

import Data.Char (ord)
import Data.List (sort, mapAccumL)
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

import Euler.Lib.Solution (Solution(MkSolution))

charValue :: Char -> Int
charValue c = ord c - ord 'A' + 1

value :: T.Text -> Int
value = T.foldl (\v c -> charValue c + v) 0

testNames :: [T.Text]
testNames = map T.pack ["COLIN", "A"]

sumValues :: [T.Text] -> Int
sumValues names = sum values
  where
    values = snd $ mapAccumL (\i name -> (i+1, value name * i)) 1 (sort names)

solve :: IO Solution
solve = do
  namesStr <- TIO.readFile "data/p022_names.txt"
  let names = map (T.dropAround (=='"')) (T.splitOn (T.pack ",") namesStr)
  return (MkSolution (sumValues names))
