module Day01 (parse, p1, p2) where

import Data.Bifunctor (first)

parse :: String -> [Int]
parse = map (read . f) . lines
    where
        f ('L':xs) = '-':xs
        f ('R':xs) = xs
        f _        = undefined

p1 :: [Int] -> Int
p1 = go 0 50
    where
        go n _ []     = n
        go n v (r:rs) =
            let u = rotate v r
                m = if u == 0 then n + 1 else n
            in go m u rs

        rotate v r = (v + r) `mod` 100


p2 :: [Int] -> Int
p2 = go 0 50
    where
        go n _ []      = n
        go n v (r:rs)  = 
            let (m, u) = rotate v r
            in go (n + m) u rs

        rotate v r = first abs $ (v + r) `divMod` 100
