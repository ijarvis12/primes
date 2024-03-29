#!/usr/bin/env lua

--[[ program that finds prime numbers --]]

require("math")

print("")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print(" This program finds prime numbers ")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print("")

print("Enter max number to search to:")
-- variable maxn is the maximum number that the program with search primes (starts at 2)
maxn = io.read()

-- check to see if input, attempt to make it into integer, else exit
if #maxn > 0 then
    local function maxnToNum()
        maxn = tonumber(maxn)
        return true
    end
    local err = pcall(maxnToNum)
    if not(err) then
        print("Bad input")
        print("Press <Enter> to end program")
        _ = io.read()
        os.exit()
    end
else
    os.exit()
end

-- check if maxn is sane
if maxn <= 1 then
    print("Bad input")
    print("Press <Enter> to end program")
    _ = io.read()
    os.exit()
end

print("The primes:")

-- find primes
for n = 2,maxn,1 do
    nope = true
    for p = 2,math.ceil(math.sqrt(n)),1 do
        if n % p == 0 then
            nope = false
            break
        end
    end
    if nope then
        print(n)
    end
end

-- end program
print("Press <Enter> to end program")
_ = io.read()
