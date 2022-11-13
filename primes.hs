#!/usr/bin/env runhaskell

--program that finds prime numbers

check :: Integer -> Integer -> Bool
check n x = (mod x n) == 0

primes :: Integer -> Integer -> Integer -> Bool -> IO ()
primes n x 1 False = print x
primes n x end False = primes (n+1) x (end-1) (check n x)
primes n x end True = return ()

loop :: Integer -> Integer -> Integer -> IO ()
loop x y 2 = return ()
loop x y end = do
    let z = toInteger (ceiling (sqrt (fromIntegral x :: Float)))
    primes 2 x z False
    loop (x+1) y (end-1)

main :: IO ()
main = do
    putStrLn "Finding primes..."
    putStrLn "Enter max number to search to:"
    i <- getLine
    putStrLn "\n2\n3"
    let y = read i :: Integer
    loop 4 y y
