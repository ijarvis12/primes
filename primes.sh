#!/bin/bash

##                                  ##
## program that finds prime numbers ##
##                                  ##

echo ""
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo " This program finds prime numbers "
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo ""



# get number of cpus
numprocs=$(grep processor /proc/cpuinfo | wc -l)

# allocate a shared memory segment name for this process
sync=/dev/shm/syncmem-$$
echo "Using $sync"

#init the shm
echo '' > $sync



# function primes finds the prime numbers given inputs
# inputs: $1: number of processes running the function
#         $2: process number
#         $3: integer to see if prime
function primes(){
#   variable start is the starting point to search from
    start=$(bc <<< "sqrt($3)*$2/$1")
    if [[ $start -lt 2 ]]; then
        let "start = 2"
    fi

#   variable end is the ending point to search to
    end=$(bc <<< "sqrt($3)*($2+1)/$1+1")
    if [[ $end -lt 2 ]]; then
        let "end = 2"
    fi

#   do the grunt work
    for (( b=$start; b<$end; b++ )); do
        let "cond = $3 % b"
        if [[ $cond -eq 0 ]]; then
            echo "0\n" >> $sync
                break
        fi
    done
}


echo "Enter max number to search to:"

declare -i maxn
read maxn

# check if maxn is sane
if [[ $maxn -le 1 ]]; then
    echo "Bad input"
    exit 1
fi


echo "The primes:"

# start loop to find primes
for (( n=2; n<$maxn; n++ )); do

#   first check if n is too small, if so skip
    cond=$(bc <<< "sqrt($n)")
    if [[ $numprocs -gt $cond ]]; then
        echo "$n is to small to compute properly"
        continue
    fi

    for (( proc=0; proc<$numprocs; proc++ )); do
        primes $numprocs $proc $n &
    done

#   wait for jobs to finish
    wait

#   determine if we have a prime
    bool=$(wc -c $sync | cut -d' ' -f1)
    if [[ $bool -lt 2 ]]; then
        echo $n
    fi

#   start over the shared memory
    echo '' > $sync

done

# cleanup
rm $sync

exit 0
