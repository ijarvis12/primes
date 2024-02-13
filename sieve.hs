#!/usr/bin/env runhaskell

--program that finds prime numbers
--using the Sieve of Eratosthenes

check :: Integer -> Integer -> Bool
check x n = (mod x n) == 0

additem :: Integer -> [Integer] -> Bool -> [Integer]
additem _ lst False = lst
additem x lst True = lst ++ [x]

sieve :: Integer -> [Integer] -> Bool -> Bool
sieve _ _ True = False
sieve _ [] False = True
sieve x lst False = sieve x (tail lst) (check x (head lst))

loop :: Integer -> Integer -> [Integer]-> IO ()
loop _ 3 lst = print lst
loop x end lst = loop (x+1) (end-1) (additem x lst (sieve x lst False))

main :: IO ()
main = do
    putStrLn "Finding primes..."
    putStrLn "Enter max number to search to:"
    i <- getLine
    let z = read i :: Integer
    loop 4 (max (abs z) 4) [2,3]
