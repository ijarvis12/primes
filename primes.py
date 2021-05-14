#!/usr/bin/python3

# function primes finds the prime numbers given inputs
# inputs: numprocs: number of processes running the function
#                p: process number
#                n: integer to see if prime
#      return_list: dictionary of return values
def primes(numprocs,p,n,return_list):

#       variable start is the starting point to search from
        start = int(sqrt(n))*p//numprocs
        if start < 2:
            start = 2
        
#       variable end is the ending point to search to
        end = int(sqrt(n))*(p+1)//numprocs
        if end < 2:
            end = 2

#       do the grunt work
        for b in range(start,end+1):
            if n % b == 0:
                return_list.append(False)
                break

##                                                  ##
## main process that spawns jobs for finding primes ##
##                                                  ##
if __name__ == '__main__':

    import multiprocessing
    from math import sqrt

#   number of processes the computer has
    numprocs = multiprocessing.cpu_count()

    print("")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print(" This program finds prime numbers ")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("")

#   maximum number to search to
    maxn = input("Enter max number to search to: ")

#   attempt to make maxn into integer if exists, else exit
    if len(maxn) > 0:
        try:
            maxn = int(maxn)
        except:
            print("Bad input")
            garbage = input("Press <Enter> to end program")
            exit()
    else:
        exit()

#   check maxn to see if it's sane
    if int(sqrt(maxn)) < numprocs - 1:
        print("Bad input")
        garbage = input("Press <Enter> to end program")
        exit()

    print("The primes:")
    
    print(2)

#   start loop to find primes
    for n in range(2,maxn):

#       first check if n is too small, if so skip
        if numprocs > int(sqrt(n)):
                print(n,"is to small to compute properly")
                continue
        
#       multiprocessing jobs
        jobs = []
        
#       shared list between processes
        return_list = multiprocessing.Manager().list()
    
#       start jobs
        for p in range(numprocs):
            job = multiprocessing.Process(target=primes, args=(numprocs,p,n,return_list,))
            jobs.append(job)
            job.start()

#       wait for jobs to finish
        for job in jobs:
            job.join()

#       print number if prime        
        if False in return_list:
            pass
        else:
            print(n)

    garbage = input("Press <Enter> to end program")
