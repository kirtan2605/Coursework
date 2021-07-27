from nrm import *
import numpy as np
import matplotlib.pyplot as plt
"""
x0 : initial point
e : permissible error
N : maximum number of iterations
"""

f1_value_at_roots_R1 = []
f1_value_at_roots_R2 = []
f2_value_at_roots_R1 = []
f2_value_at_roots_R2 = []

f1_value_at_roots_R1 = newtonRaphson(func_num = 1,x0 = 11,e = 0.001,N = 10)
f1_value_at_roots_R2 = newtonRaphson(func_num = 1,x0 = -12,e = 0.001,N = 10)
f2_value_at_roots_R1 = newtonRaphson(func_num = 2,x0 = 11,e = 0.001,N = 10)
f2_value_at_roots_R2 = newtonRaphson(func_num = 2,x0 = -12,e = 0.001,N = 10)

f1_N_R1 = np.arange(1,len(f1_value_at_roots_R1)+1)
f1_N_R2 = np.arange(1,len(f1_value_at_roots_R2)+1)
f2_N_R1 = np.arange(1,len(f2_value_at_roots_R1)+1)
f2_N_R2 = np.arange(1,len(f2_value_at_roots_R2)+1)

#print(f1_value_at_roots_R1)

# Plotting Absolute Values
f1_value_at_roots_R1_ABS =  [abs(ele) for ele in f1_value_at_roots_R1]
f1_value_at_roots_R2_ABS =  [abs(ele) for ele in f1_value_at_roots_R2]
f2_value_at_roots_R1_ABS =  [abs(ele) for ele in f2_value_at_roots_R1]
f2_value_at_roots_R2_ABS =  [abs(ele) for ele in f2_value_at_roots_R2]

# change the data and use the following code
# to plot and save for both the Functions ABSOLUTE VALUES
plt.plot(f1_N_R1,f1_value_at_roots_R1_ABS,'.-',label = 'initial point : 11')
plt.plot(f1_N_R2,f1_value_at_roots_R2_ABS,'.-',label = 'initial point : -12')
plt.xlabel('N',fontsize = 10)
plt.ylabel('Function Value at Root',fontsize = 10)
plt.xticks(fontsize = 8)
plt.yticks(fontsize = 8)
plt.title('Newton-Raphson Method - Function1 Absolute Value - permissible error : 0.001')
plt.grid(linestyle = '--')
plt.legend()
plt.savefig('nrm-f1-abs.png')
plt.show()
