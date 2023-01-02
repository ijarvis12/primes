#!/usr/bin/env runhaskell

--program that finds number of digits of Mersenne primes

import Data.Bits

main :: IO ()
main = do
    putStrLn "Finding Mersenne prime digits length..."
    putStrLn "Enter power:"
    i <- getLine
    putStrLn " "
    let x = read i :: Int
    let y = ((shiftL 1 x) :: Integer) - 1
    print (length (show y))
