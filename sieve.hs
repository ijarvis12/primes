#!/usr/bin/env runhaskell

--program that finds prime numbers
--using the Sieve of Eratosthenes

additem :: Integer -> [Integer] -> Bool -> [Integer]
additem _ lst False = lst
additem x lst True = lst ++ [x]

sieve :: Integer -> Integer -> [Integer] -> Bool -> Bool -> Bool
sieve _ _ _ True _ = False
sieve _ _ _ False False = True
sieve x limit (l:ls) False True = sieve x limit ls ((mod x l)==0) (l<limit)

loop :: Integer -> Integer -> [Integer] -> IO ()
loop _ 7 lst = print lst
loop x end lst = loop (x+1) (end-1) (additem x lst (sieve x ((toInteger (ceiling (sqrt (fromIntegral x)))) + 1) lst False True))

main :: IO ()
main = do
    putStrLn "Finding primes..."
    putStrLn "Enter max number to search to:"
    i <- getLine
    let z = read i :: Integer
    loop 8 (max (abs z) 8) [2,3,5,7]
