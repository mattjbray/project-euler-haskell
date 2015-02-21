import Data.List (mapAccumL)

triangles :: [Int]
triangles = snd $ mapAccumL (\ acc x -> (acc + x, acc + x)) 0 [1..]

factorsOf :: Int -> [Int]
factorsOf n = concat [[x, n `div` x] | x <- takeWhile (< limit) [1..], n `mod` x == 0]
  where
    limit :: Int
    limit = (ceiling . sqrt . fromIntegral) n

main = print $ head [x | x <- triangles, length (factorsOf x) > 500]
