#!/usr/bin/env runhaskell

--program that finds prime numbers

check :: Integer -> Integer -> Bool
check x n = (mod x n) == 0

prnt :: Integer -> Bool -> IO ()
prnt x True = print x
prnt _ False = return ()

additem :: Integer -> [Integer] -> Bool -> [Integer]
additem _ lst False = lst
additem x lst True = lst ++ [x]

sieve :: Integer -> Integer -> Integer -> [Integer] -> Bool -> Bool
sieve _ 0 _ [] False = True
sieve _ _ _ _ True = False
sieve x y z [] False = sieve x (y-1) (z-1) [] (check x z)
sieve x y z lst False = sieve x y z (tail lst) (check x (head lst))

loop :: Integer -> Integer -> [Integer]-> IO ()
loop _ 3 _ = return ()
loop x end lst = do
    let z = toInteger (ceiling (sqrt (fromIntegral x)))
    let b = sieve x (mod (last lst) z) z lst False
    prnt x b
    loop (x+1) (end-1) (additem x lst b)

main :: IO ()
main = do
    putStrLn "Finding primes..."
    putStrLn "Enter max number to search to:"
    i <- getLine
    putStrLn "\n2\n3"
    let y = read i :: Integer
    loop 4 y [2,3]
