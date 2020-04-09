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
            if n%b == 0:
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

    print("The primes:")
    
    print(2)

#   starting Mersenne prime power
    x = 2

#   start loop to find primes
    while True:
    
#       Mersenne prime
        n = 2**x - 1

#       multiprocessing jobs
        jobs = []

#       shared dictionary between processes
        return_list = multiprocessing.Manager().list()
        
#       start jobs
        for p in range(numprocs):
            job = multiprocessing.Process(target=primes, args=(numprocs,p,n,return_list,))
            jobs.append(job)
            job.start()

#       wait for jobs to finish
        for job in jobs:
            job.join()

#       first check if return_dict has anything (numprocs may be too high)
        if len(return_list) == 0:
            for b in range(2,int(sqrt(n))+1):
                if n%b == 0:
                    return_list.append(False)
            if len(return_list) == 0:
                return_list.append(True)

#       print number if prime        
        if False in return_list:
            pass
        else:
            print(n)

#       iterate Mersenne prime power
        x += 1

