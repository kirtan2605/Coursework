from bsm import *

print("Root by the bisection method with limit on number of iteration")
'''
1. f : The function whose roots we want to find
2. a : lower bound on the root
3. b : upper bound on the root
4. e : permissible error in the value of root obtained
5. N_max : maximum number of iterations after which function stops.
'''

for i in range(1,21):
    print()
    print("N_Max = {}".format(i))
    bisection(a = -5,b = 5,e = 0.0001,N_Max = i)
