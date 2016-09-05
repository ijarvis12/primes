#!/usr/bin/python3

print("")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print(" This program finds prime numbers ")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print("")

print("Enter max number to search to:")
maxn = input()

if len(maxn) > 0:
    try:
        maxn = int(maxn)
    except:
        print("Bad input")
        garbage = input("Press <Enter> to end program")
        exit()
else:
    exit()

if maxn <= 1:
    print("Bad input")
    garbage = input("Press <Enter> to end program")
    exit()

print("The primes:")

for n in range(2,maxn):
    for p in range(2,n):
        if n%p == 0:
            break
    else:
        print(n)

garbage = input("Press <Enter> to end program")
