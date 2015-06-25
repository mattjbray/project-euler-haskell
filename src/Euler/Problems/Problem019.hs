module Euler.Problems.Problem019 where

import Euler.Lib.Solution (Solution(MkSolution))

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Enum, Eq, Show)

add :: Day -> Int -> Day
add d i = toEnum ((fromEnum d + i) `mod` 7)

leapYear :: Int -> Bool
leapYear year = year `mod` 4 == 0 && (year `mod` 100 /= 0 || year `mod` 400 == 0)

-- number of days in each month for a given year
daysPerMonth :: Int -> [Int]
daysPerMonth year = [31, if leapYear year then 29 else 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

daysInYear :: Int -> Int
daysInYear = sum . daysPerMonth

-- The Day on 1 Jan 1901, given 1 Jan 1900 was a Monday
startDay :: Day
startDay = Monday `add` daysInYear 1900

monthStartDays :: [Day]
monthStartDays = foldl (\days n -> days ++ [last days `add` n]) [startDay] (concatMap daysPerMonth [1901..2000])

solve :: Solution
solve = MkSolution $ length (filter (==Sunday) monthStartDays)
