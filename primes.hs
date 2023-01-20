#!/usr/bin/env runhaskell

--program that finds prime numbers

check :: Integer -> Integer -> Bool
check x n = (mod x n) == 0

primes :: Integer -> Integer -> Bool -> IO ()
primes x 1 False = print x
primes x end False = primes x (end-1) (check x end)
primes _ _ True = return ()

loop :: Integer -> Integer -> IO ()
loop _ 2 = return ()
loop x end = do
    let z = toInteger (ceiling (sqrt (fromIntegral x)))
    primes x z False
    loop (x+1) (end-1)

main :: IO ()
main = do
    putStrLn "Finding primes..."
    putStrLn "Enter max number to search to:"
    i <- getLine
    putStrLn "\n2\n3"
    let y = read i :: Integer
    loop 4 y
