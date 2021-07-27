import numpy as np
import matplotlib.pyplot as plt
from nm import *
"""
x0 : initial point
e : permissible error
N : maximum number of iterations
"""
f_N_nrm = []
f_val_at_roots_nrm = []
f_val_at_roots_nrm = newtonRaphson(x0 = 0,e = 0.001,N = 16)
f_N_nrm = np.arange(1,len(f_val_at_roots_nrm)+1)
f_abs_val_at_roots_nrm =  [abs(ele) for ele in f_val_at_roots_nrm]


# to plot and save for both the Functions ABSOLUTE VALUES
plt.plot(f_N_nrm,f_abs_val_at_roots_nrm,'.-',label = 'initial point : 0')
plt.xlabel('N',fontsize = 10)
plt.ylabel('Function Value at Root',fontsize = 10)
plt.ylim(0,3)
plt.xticks(fontsize = 8)
plt.yticks(fontsize = 8)
plt.title('Special_Case Newton-Raphson Method - f(x) = x^3 - 2x + 2')
plt.grid(linestyle = '--')
plt.legend()
plt.savefig('special_case_newton-raphson.png')
plt.show()
