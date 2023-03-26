#!/bin/bash

##                                  ##
## program that finds prime numbers ##
##                                  ##

echo ""
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo " This program finds prime numbers "
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo ""

echo "Enter max number to search to:"

declare -i maxn
read maxn

# check if maxn is sane
if [[ $maxn -le 1 ]]; then
    echo "Bad input"
    exit 1
fi

echo "The primes:"

# find primes
for (( n=2; n<$maxn; n++ )); do
    prime=1
    cond=$(bc <<< "sqrt($n)+1")
    for (( p=2; p<$cond; p++ )); do
        if [[ $((n % p)) -eq 0 ]]; then
            prime=0
            break
        fi
    done
    if [[ $prime -eq 1 ]]; then
        echo $n
    fi
done

exit 0
