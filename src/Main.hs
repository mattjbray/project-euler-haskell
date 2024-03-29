import Prelude hiding (lookup)
import Data.Function (on)
import Data.List (intercalate, sortBy)
import Data.Map (Map, fromList, lookup, keys)
import System.Environment (getArgs)

import Euler.Lib.Solution (Solution)
import qualified Euler.Problems.Problem001 as P001
import qualified Euler.Problems.Problem002 as P002
import qualified Euler.Problems.Problem003 as P003
import qualified Euler.Problems.Problem004 as P004
import qualified Euler.Problems.Problem005 as P005
import qualified Euler.Problems.Problem006 as P006
import qualified Euler.Problems.Problem007 as P007
import qualified Euler.Problems.Problem008 as P008
import qualified Euler.Problems.Problem009 as P009
import qualified Euler.Problems.Problem010 as P010
import qualified Euler.Problems.Problem011 as P011
import qualified Euler.Problems.Problem012 as P012
import qualified Euler.Problems.Problem013 as P013
import qualified Euler.Problems.Problem014 as P014
import qualified Euler.Problems.Problem015 as P015
import qualified Euler.Problems.Problem016 as P016
import qualified Euler.Problems.Problem017 as P017
import qualified Euler.Problems.Problem018 as P018
import qualified Euler.Problems.Problem019 as P019
import qualified Euler.Problems.Problem020 as P020
import qualified Euler.Problems.Problem021 as P021
import qualified Euler.Problems.Problem022 as P022
import qualified Euler.Problems.Problem023 as P023
import qualified Euler.Problems.Problem024 as P024
import qualified Euler.Problems.Problem025 as P025

solvers :: Map String Solution
solvers = fromList [ ("1" , P001.solve)
                   , ("2" , P002.solve)
                   , ("3" , P003.solve)
                   , ("4" , P004.solve)
                   , ("5" , P005.solve)
                   , ("6" , P006.solve)
                   , ("7" , P007.solve)
                   , ("8" , P008.solve)
                   , ("9" , P009.solve)
                   , ("10", P010.solve)
                   , ("11", P011.solve)
                   , ("12", P012.solve)
                   , ("13", P013.solve)
                   , ("14", P014.solve)
                   , ("15", P015.solve)
                   , ("16", P016.solve)
                   , ("17", P017.solve)
                   , ("18", P018.solve)
                   , ("19", P019.solve)
                   , ("20", P020.solve)
                   , ("21", P021.solve)
                   , ("23", P023.solve)
                   , ("24", P024.solve)
                   , ("25", P025.solve)
                   ]

ioSolvers :: Map String (IO Solution)
ioSolvers = fromList [ ("22", P022.solve) ]

solvedProblems :: [String]
solvedProblems = sortBy (compare `on` length) (keys solvers ++ keys ioSolvers)

main :: IO ()
main = do
  args <- getArgs
  if any (\arg -> arg == "-h" || arg == "--help") args
    then putStrLn "usage: project-euler-haskell [<problem_number>...]"
    else if null args
      then mapM_ solve solvedProblems
      else mapM_ solve args
  where
    solve problem = case lookup problem solvers of
      Just x -> showSolution problem x
      Nothing -> case lookup problem ioSolvers of
        Just x -> x >>= showSolution problem
        Nothing -> putStr $ unlines [ "no solver for problem " ++ problem
                                    , "solved problems: " ++ intercalate ", " solvedProblems
                                    ]
    showSolution problem x = putStrLn ("problem " ++ problem ++ ": " ++ show x)
