module Main (main) where

import Day01

main :: IO ()
main = interact (f . parse)
  where
    f xs =    "Part 1: " ++ show (p1 xs) ++ "\n"
           ++ "Part 2: " ++ show (p2 xs) ++ "\n"

