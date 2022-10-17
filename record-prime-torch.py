#!/usr/bin/env python3

print("")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print(" This program finds prime numbers ")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print("")

import torch
from math import sqrt

cpu = torch.device('cpu')
cuda = torch.device('cuda')

print("The primes:")
print(2)

# starting Mersenne prime power
x = 1

# start loop to find primes
while x<1000:
	
#	iterate Mersenne prime power
	x += 1
	
#	use gpu
	with torch.cuda.device(cuda):

#		Mersenne prime
		n = torch.tensor((1<<x) - 1).cuda()
		bl = torch.tensor(0, device=cuda)
	
#		do the grunt work
		end = int(sqrt(n.item())) + 1
		for i in range(2,end):
			if n % i == 0:
				bl = 1
				break
		
#		send vars to cpu for displaying
		bl.to(device=cpu)
		n.to(device=cpu)
		
#	print number if prime        
	if bl.item() == 1:
		pass
	else:
		print(n.item())

print()
_ = input('Press <Enter> to end program.')
