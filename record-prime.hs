--compile with ghc -Ox -threaded --make record-prime.hs [where x is # of threads]
--run with ./record-prime +RTS -Nx [where x is the number from above]

--program that finds large prime numbers
--multiprocessed
--essentially you need a supercomputer with many cores

import System.IO
import Control.Monad
import Control.Parallel

--Guts of program, most work happens here
primework :: Integer -> Integer -> [Bool]
primework n y = do
    if ((y `mod` n) == 0) then
        [False]
    else
        [True]

--Find value to make computation faster, then start computing!
startprimes :: Integer -> [[Bool]]
startprimes y = do
    --starting value to modulo on
    let z = 2 :: Integer
    --upper limit of modulo need to check
    let w = round (sqrt y) :: Integer
    --do the work of finding the prime
    forM [z..w] $ \n -> primework n y

--The loop that iterates the Mersenne prime
loop :: Integer -> IO ()
loop x = do
    --the power of the Mersenne prime
    putStrLn " "
    putStrLn "Current power:"
    print x
    --the Mersenne prime
    let y = 2^(x)-1
    putStrLn "Current Mersenne Prime:"
    print y
    --start the overhead of finding the prime
    if (False `elem` (head (startprimes y))) then
        --iterate to the next Mersenne prime
        loop (x+1)
    --else write the prime to file
    else do
        putStrLn " "
        putStrLn "PRIME!!!"
        putStrLn " "
        let s = "Power: " ++ (show x) ++ "\n" ++ "Prime: " ++ (show y) ++ "\n"
        writeFile "./prime.dat" s

--Main function, start here
main :: IO ()
main = do
    putStrLn "Finding record prime..."
    --the current record is a Mersenne prime with the power of 82589933
    let x = 10
    loop x
