digits :: Integral x => x -> [x]
digits 0 = []
digits x = digits (x `div` 10) ++ [x `mod` 10]

isPalindrome :: Eq a => [a] -> Bool
isPalindrome []     = True
isPalindrome [x]    = True
isPalindrome (x:xs) = x == last xs && isPalindrome (init xs)

result = maximum [x * y | x <- [999,998..100], y <- [999,998..x], (isPalindrome . digits) (x * y)]

main = print result
