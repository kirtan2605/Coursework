import numpy as np
import matplotlib.pyplot as plt
from values_bsm import *

"""
1. f : The function whose roots we want to find
2. a : lower bound on the root
3. b : upper bound on the root
4. e : permissible error in the value of root obtained
5. N_max : maximum number of iterations after which function stops.
"""

"""Function 1"""

# for range 1 : {-3,0}, error = 0.0001
root = 0
f1_N_R1 = []
f1_Roots_R1 = []

for i in range(1,11):
    #print()
    #print("N_Max = {}".format(i))
    root = bisection(func_num = 1,a = -3,b = 0,e = 0.001,N_Max = i)
    f1_N_R1.append(i)
    f1_Roots_R1.append(root)


# for range 2 : {-5,5}, error = 0.0001
root = 0
f1_N_R2 = []
f1_Roots_R2 = []

for i in range(1,11):
    #print()
    #print("N_Max = {}".format(i))
    root = bisection(func_num = 1, a = -5,b = 5,e = 0.001,N_Max = i)
    f1_N_R2.append(i)
    f1_Roots_R2.append(root)

#print(f1_N_R2)
#print(f1_Roots_R2)
#print()

"""Function 2"""

# for range 1 : {-3,0}, error = 0.0001
root = 0
f2_N_R1 = []
f2_Roots_R1 = []

for i in range(1,11):
    #print()
    #print("N_Max = {}".format(i))
    root = bisection(func_num = 2, a = -3,b = 0,e = 0.001,N_Max = i)
    f2_N_R1.append(i)
    f2_Roots_R1.append(root)


# for range 2 : {-5,5}, error = 0.0001
root = 0
f2_N_R2 = []
f2_Roots_R2 = []

for i in range(1,11):
    #print()
    #print("N_Max = {}".format(i))
    root = bisection(func_num = 2, a = -5,b = 5,e = 0.001,N_Max = i)
    f2_N_R2.append(i)
    f2_Roots_R2.append(root)

func = np.vectorize(f)
f1_value_at_roots_R1 = func(1,f1_Roots_R1)
f1_value_at_roots_R2 = func(1,f1_Roots_R2)
f2_value_at_roots_R1 = func(2,f2_Roots_R1)
f2_value_at_roots_R2 = func(2,f2_Roots_R2)

"""
# change the data and use the following code
# to plot and save for both the Functions
plt.plot(f2_N_R1,f2_value_at_roots_R1,'.-',label = 'initial Limit : {-3,0}')
plt.plot(f2_N_R2,f2_value_at_roots_R2,'.-',label = 'initial Limit : {-5,5}')
plt.xlabel('N',fontsize = 10)
plt.ylabel('Function Value at Root',fontsize = 10)
plt.xticks(fontsize = 8)
plt.yticks(fontsize = 8)
plt.title('Bisection Method - Function2 - permissible error : 0.0001')
plt.grid(linestyle = '--')
plt.legend()
plt.savefig('bsm-f2.png')
plt.show()
"""

# Plotting Absolute Values
f1_value_at_roots_R1_ABS =  [abs(ele) for ele in f1_value_at_roots_R1]
f1_value_at_roots_R2_ABS =  [abs(ele) for ele in f1_value_at_roots_R2]
f2_value_at_roots_R1_ABS =  [abs(ele) for ele in f2_value_at_roots_R1]
f2_value_at_roots_R2_ABS =  [abs(ele) for ele in f2_value_at_roots_R2]

# change the data and use the following code
# to plot and save for both the Functions ABSOLUTE VALUES
plt.plot(f2_N_R1,f2_value_at_roots_R1_ABS,'.-',label = 'initial Limit : {-3,0}')
plt.plot(f2_N_R2,f2_value_at_roots_R2_ABS,'.-',label = 'initial Limit : {-5,5}')
plt.xlabel('N',fontsize = 10)
plt.ylabel('Function Value at Root',fontsize = 10)
plt.xticks(fontsize = 8)
plt.yticks(fontsize = 8)
plt.title('Bisection Method - Function2 Absolute Value - permissible error : 0.001')
plt.grid(linestyle = '--')
plt.legend()
plt.savefig('bsm-f2-abs.png')
plt.show()
