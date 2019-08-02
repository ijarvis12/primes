#!/usr/bin/env runhaskell

--program that finds number of digits of Mersenne primes

prime :: Integer -> IO ()
prime x = do
    let y = 2^x - 1
    print (length (show y))

main :: IO ()
main = do
    putStrLn "Finding Mersenne prime..."
    putStrLn "Enter power:"
    i <- getLine
    putStrLn " "
    let x = read i :: Integer
    prime x
