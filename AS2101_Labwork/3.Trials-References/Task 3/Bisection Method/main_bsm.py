from bsm import *
from bsm2 import *

print("Root by the bisection method with only error limit")
print('''
1. f : The function whose roots we want to find
2. a : lower bound on the root
3. b : upper bound on the root
4. e : permissible error in the value of root obtained
''')
bisection(a = 1,b = 10,e = 0.1)
print()
print()

print("Root by the bisection method with limit on number of iteration")
print('''
1. f : The function whose roots we want to find
2. a : lower bound on the root
3. b : upper bound on the root
4. e : permissible error in the value of root obtained
5. N_max : maximum number of iterations after which function stops.
''')
bisection2(a = 1,b = 10,e = 0.1,N_Max = 6)
