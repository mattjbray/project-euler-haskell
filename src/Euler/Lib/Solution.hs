{-# LANGUAGE ExistentialQuantification #-}

module Euler.Lib.Solution ( Solution(MkSolution) )

where

data Solution = forall a. Show a => MkSolution a

instance Show Solution where
  show (MkSolution a) = show a
