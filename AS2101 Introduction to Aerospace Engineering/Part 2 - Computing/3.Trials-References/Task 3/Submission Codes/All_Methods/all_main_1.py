import numpy as np
import matplotlib.pyplot as plt
from all import *

""" Bisection Method """
root = 0
f_N_bsm = []
f_val_at_roots_bsm = []

for i in range(1,11):
    #print()
    #print("N_Max = {}".format(i))
    root = bisection(func_num = 1,a = -2,b = 2,e = 0.001,N_Max = i)
    f_N_bsm.append(i)
    f_val_at_roots_bsm.append(f(2,root))
f_abs_val_at_roots_bsm =  [abs(ele) for ele in f_val_at_roots_bsm]

""" Newton-Raphson Method """
f_N_nrm = []
f_val_at_roots_nrm = []
f_val_at_roots_nrm = newtonRaphson(func_num = 1,x0 = 6,e = 0.001,N = 10)
f_N_nrm = np.arange(1,len(f_val_at_roots_nrm)+1)
f_abs_val_at_roots_nrm =  [abs(ele) for ele in f_val_at_roots_nrm]

""" Secant Method """

f_N_secm = []
f_val_at_roots_secm = []
for i in range(1,11):
    val_at_root = secant(f_num = 1,a = 1,b = -2,e = 0.001,N_Max = i)
    f_N_secm.append(i)
    f_val_at_roots_secm.append(val_at_root)
f_abs_val_at_roots_secm =  [abs(ele) for ele in f_val_at_roots_secm]


# to plot and save for both the Functions ABSOLUTE VALUES
plt.plot(f_N_bsm,f_abs_val_at_roots_bsm,'.-',label = 'Bisection Method initial Limit : (-2,2)')
plt.plot(f_N_nrm,f_abs_val_at_roots_nrm,'.-',label = 'Newton-Raphson Method initial point : 6')
plt.plot(f_N_secm,f_abs_val_at_roots_secm,'.-',label = 'Secant Method initial points : {1,-2}')
plt.xlabel('N',fontsize = 10)
plt.ylabel('Function Value at Root',fontsize = 10)
plt.xticks(fontsize = 8)
plt.yticks(fontsize = 8)
plt.title('Comparison of Root Finding Methods - Function1 Absolute Value - permissible error : 0.001')
plt.grid(linestyle = '--')
plt.legend()
plt.savefig('all-f1-abs.png')
plt.show()
