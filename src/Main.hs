import Prelude hiding (lookup)
import Control.Concurrent (forkFinally)
import Control.Concurrent.MVar (MVar, newEmptyMVar, putMVar, takeMVar)
import Data.Function (on)
import Data.List (intercalate, sortBy)
import Data.Map (Map, fromList, lookup, keys)
import System.Environment (getArgs)

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

solvers :: Map String Int
solvers = fromList [ ("1" , P001.solve)
                   , ("2" , P002.solve)
                   , ("3" , P003.solve)
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
                   ]

solvedProblems :: [String]
solvedProblems = sortBy (compare `on` length) (keys solvers)

solve :: String -> IO ()
solve problem = case lookup problem solvers of
  Just x  -> putStrLn ("problem " ++ problem ++ ": " ++ show x)
  Nothing -> putStr $ unlines [ "no solver for problem " ++ problem
                              , "solved problems: " ++ intercalate ", " solvedProblems
                              ]

myForkIO :: IO () -> IO (MVar ())
myForkIO io = do
  mvar <- newEmptyMVar
  _ <- forkFinally io (\_ -> putMVar mvar ())
  return mvar

main :: IO ()
main = do
  args <- getArgs
  if any (\arg -> arg == "-h" || arg == "--help") args
    then putStrLn "usage: project-euler-haskell [<problem_number>...]"
    else do
      mvars <- mapM (myForkIO . solve) (if null args then solvedProblems else args)
      -- wait on threads
      mapM_ takeMVar mvars
      putStrLn "Done."
