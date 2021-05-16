--compile with ghc -Ox -threaded --make primes2.hs [where x is # of threads]
--run with ./primes2 +RTS -Nx [where x is the number from above]

--program that finds prime numbers
--multiprocessed

import Control.Monad
import Control.Parallel

innrprime :: Integer -> Integer -> [Bool]
innrprime n x =
        if ((x `mod` n) == 0) then
            [False]
        else
            [True]

prime :: Integer -> [[Bool]]
prime x = do
    let z = 2 :: Integer
    let w = (sqrt x + 1) :: Integer
    forM [z..w] $ \n -> innrprime n x

loop :: Integer -> Integer -> IO ()
loop x y =
    if (x > y) then
        return ()
    else
        if (False `elem` (head (prime x))) then
            loop (x+1) y
        else do
            print x
            loop (x+1) y

main :: IO ()
main = do
    putStrLn "Finding primes..."
    putStrLn "Enter max number to search to:"
    i <- getLine
    putStrLn "\n2"
    let y = read i :: Integer
    let x = 3 :: Integer
    loop x y
