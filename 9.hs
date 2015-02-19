nums = [x * y * z | x <- [1..], y <- [1..x], z <- [1..y], x*x == y*y + z*z, x + y + z == 1000]

main = print $ head nums
