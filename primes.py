#!/usr/bin/python3

# function primes finds the prime numbers given inputs
# inputs: numprocs: number of processes running the function
#                p: process number
#             maxn: maximum integer to search for primes
def primes(numprocs,p,maxn):
    # variable a is the starting number to search for primes
    # defined as the max integer times process number divided by number of processes
    a = int(float(maxn*p)/float(numprocs))

    while a < int(float(maxn*(p+1))/float(numprocs)):

        for b in range(2,a):
            if a%b == 0:
                break
        else:
            print(a)
        
#       increment variable
        a += 1

##                                                  ##
## main process that spawns jobs for finding primes ##
##                                                  ##
if __name__ == '__main__':

    import multiprocessing
    from time import sleep

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
    if maxn <= 1:
        print("Bad input")
        garbage = input("Press <Enter> to end program")
        exit()

    print("The primes:")

#   start multiprocessing jobs
    jobs = []
    for p in range(numprocs):
        job = multiprocessing.Process(target=primes, args=(numprocs,p,maxn,))
        jobs.append(job)
        job.start()
#       need to sleep main process to let subprocess start before main process spawns another
        sleep(0.1)
#   wait for jobs to finish
    for job in jobs:
        job.join()

    garbage = input("Press <Enter> to end program")
