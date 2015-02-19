sumSqaures xs = sum (map (\ x -> x*x) xs)
squareSum xs = let s = sum xs in s * s

diff xs = squareSum xs - sumSqaures xs

main = print $ diff [1..100]
