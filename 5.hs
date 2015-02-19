target = 20

nonFactors = [x | x <- [2..target], target `mod` x /= 0]

toTest = target : (reverse nonFactors)

isDivisible n = all (\ x -> mod n x == 0) toTest

main = print $ head [x | x <- [target,2 * target..], isDivisible x]
