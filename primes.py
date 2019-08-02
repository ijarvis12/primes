#!/usr/bin/python3

# function primes finds the prime numbers given inputs
# inputs: numprocs: number of processes running the function
#                p: process number
#                n: integer to see if prime
#      return_dict: dictionary of return values
def primes(numprocs,p,n,return_dict):

#       variable start is the starting point to search from
        start = n*p//(2*numprocs)
        if start < 2:
            start = 2
        
#       variable end is the ending point to search to
        end = n*(p+1)//(2*numprocs)
        if end < 2:
            end = 2

#       do the grunt work
        for b in range(start,end):
            if n%b == 0:
                return_dict[b] = False
                break

##                                                  ##
## main process that spawns jobs for finding primes ##
##                                                  ##
if __name__ == '__main__':

    import multiprocessing

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
    if maxn < 2:
        print("Bad input")
        garbage = input("Press <Enter> to end program")
        exit()

    print("The primes:")

#   shared dictionary between processes
    return_dict = multiprocessing.Manager().dict()

#   start loop to find primes
    for n in range(2,maxn):

#       start multiprocessing jobs
        jobs = []
        return_dict.clear()
        
        for p in range(numprocs):
            job = multiprocessing.Process(target=primes, args=(numprocs,p,n,return_dict,))
            jobs.append(job)
            job.start()

#       wait for jobs to finish
        for job in jobs:
            job.join()

#       first check if return_dict has anything (numprocs may be too high)
        if len(return_dict) == 0:
            for b in range(2,n//2):
                if n%b == 0:
                    return_dict[b] = False
            if len(return_dict) == 0:
                return_dict[0] = True

#       print number if prime        
        if False in return_dict.values():
            pass
        else:
            print(n)

    garbage = input("Press <Enter> to end program")
