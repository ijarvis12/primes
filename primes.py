#!/usr/bin/python3

def primes(numprocs,p,maxn):
    a = int(float(maxn*p)/float(numprocs))

    while a < int(float(maxn*(p+1))/float(numprocs)):

        for b in range(2,a):
            if a%b == 0:
                break
        else:
            print(a)
        
        a += 1


if __name__ == '__main__':

    import multiprocessing
    from time import sleep

    numprocs = multiprocessing.cpu_count()

    print("")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print(" This program finds prime numbers ")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("")

    maxn = input("Enter max number to search to: ")

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

    jobs = []
    for p in range(numprocs):
        job = multiprocessing.Process(target=primes, args=(numprocs,p,maxn,))
        jobs.append(job)
        job.start()
        sleep(0.1)
    for job in jobs:
        job.join()

    garbage = input("Press <Enter> to end program")
