#!/usr/bin/env runhaskell

--program that finds prime numbers

innrprime :: Integer -> Integer -> IO ()
innrprime z x =
    if (z == (div x 2)) then
        print x
    else
        if ((x `mod` z) == 0) then
            return ()
        else
            innrprime (z+1) x

primes :: Integer -> IO ()
primes x = do
    let z = 2 :: Integer
    innrprime z x

loop :: Integer -> Integer -> IO ()
loop x y =
    if (x > y) then
        return ()
    else do
        primes x
        loop (x+1) y

main :: IO ()
main = do
    putStrLn "Finding primes..."
    putStrLn "Enter max number to search to:"
    i <- getLine
    putStrLn "\n2"
    let y = read i :: Integer
    let x = 2 :: Integer
    loop x y
