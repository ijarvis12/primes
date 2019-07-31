#!/usr/bin/env runhaskell

--finds Mersenne primes

prime :: Integer -> IO ()
prime x = do
    print (2^(x)*(2^(x+1)-1))

main :: IO ()
main = do
    putStrLn "Finding Mersenne prime..."
    putStrLn "Enter power:"
    i <- getLine
    putStrLn " "
    let x = read i :: Integer
    prime x
