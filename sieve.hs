#!/usr/bin/env runhaskell

--program that finds prime numbers
--using the Sieve of Eratosthenes

check :: Integer -> Integer -> Bool
check x n = (mod x n) == 0

check2 :: Integer -> Integer -> Bool
check2 x n = (toIntegral (ceiling (sqrt n)) :: Integer) < x

additem :: Integer -> [Integer] -> Bool -> [Integer]
additem _ lst False = lst
additem x lst True = lst ++ [x]

sieve :: Integer -> [Integer] -> Bool -> Bool -> Bool
sieve _ _ True _ = False
sieve _ _ False True = True
sieve x [l:ls] False False = sieve x ls (check x l) (check2 x l)

loop :: Integer -> Integer -> [Integer]-> IO ()
loop _ 3 lst = print lst
loop x end lst = loop (x+1) (end-1) (additem x lst (sieve x lst False False))

main :: IO ()
main = do
    putStrLn "Finding primes..."
    putStrLn "Enter max number to search to:"
    i <- getLine
    let z = read i :: Integer
    loop 4 (max (abs z) 4) [2,3]
