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

sieve :: Integer -> [Integer] -> Bool -> Bool
sieve _ _ True = False
sieve _ [] False = True
sieve x lst False = sieve x (tail lst) (check x (head lst))

loop :: Integer -> Integer -> [Integer]-> IO ()
loop _ 3 _ = return ()
loop x end lst = do
    let z = toInteger (ceiling (sqrt (fromIntegral x)))
    let b = sieve x lst False
    let c = null [y | y <- [(last lst)..z], mod x y == 0 ]
    prnt x (b&&c)
    loop (x+2) (end-2) (additem x lst (b&&c))

main :: IO ()
main = do
    putStrLn "Finding primes..."
    putStrLn "Enter max number to search to:"
    i <- getLine
    putStrLn "\n2\n3"
    let z = read i :: Integer
    loop 5 z [2,3]
