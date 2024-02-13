#!/usr/bin/env runhaskell

--program that finds prime numbers

isPrime :: Integer -> Bool
isPrime x = null [y | y <- [2..(ceiling (sqrt (fromIntegral x)))], mod x y == 0 ]

prnt :: Integer -> Bool -> IO ()
prnt _ False = return ()
prnt x True = print x

loop :: Integer -> Integer -> IO ()
loop _ 2 = return ()
loop x end = do {prnt x (isPrime x); loop (x+1) (end-1)}

main :: IO ()
main = do
    putStrLn "Finding primes..."
    putStrLn "Enter max number to search to:"
    i <- getLine
    putStrLn "\n2\n3"
    let y = read i :: Integer
    loop 4 (max (abs y) 4)
