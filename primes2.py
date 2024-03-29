#!/usr/bin/env python3

##                                  ##
## program that finds prime numbers ##
##                                  ##

from math import sqrt

print("")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print(" This program finds prime numbers ")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print("")

print("Enter max number to search to:")
# variable maxn is the maximum number that the program with search primes (starts at 2)
maxn = input()

# check to see if input, attempt to make it into integer, else exit
if len(maxn) > 0:
    try:
        maxn = int(maxn)
    except:
        print("Bad input")
        _ = input("Press <Enter> to end program")
        exit()
else:
    exit()

# check if maxn is sane
if maxn <= 1:
    print("Bad input")
    _ = input("Press <Enter> to end program")
    exit()

print("The primes:")

# find primes
for n in range(2,maxn):
    for p in range(2,int(sqrt(n))+1):
        if n % p == 0:
            break
    else:
        print(n)

_ = input("Press <Enter> to end program")
