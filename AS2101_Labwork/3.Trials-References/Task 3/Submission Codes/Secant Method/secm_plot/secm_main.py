import numpy as np
import matplotlib.pyplot as plt
from secm import *

#N_list, f_values = secant(a = -3, b = 0, e = 0.001, N_max = 15)
#print(N_list)
#print(f_values)

f1_N_R1 = []
f1_value_at_roots_R1 = []

for i in range(1,11):
    #print()
    #print("N_Max = {}".format(i))
    val_at_root = secant(f_num = 1,a = 20,b = -11,e = 0.001,N_Max = i)
    f1_N_R1.append(i)
    f1_value_at_roots_R1.append(val_at_root)



f1_N_R2 = []
f1_value_at_roots_R2 = []

for i in range(1,11):
    #print()
    #print("N_Max = {}".format(i))
    val_at_root = secant(f_num = 1,a = -10,b = -24,e = 0.001,N_Max = i)
    f1_N_R2.append(i)
    f1_value_at_roots_R2.append(val_at_root)


f2_N_R1 = []
f2_value_at_roots_R1 = []

for i in range(1,11):
    #print()
    #print("N_Max = {}".format(i))
    val_at_root = secant(f_num = 2,a = 20,b = -11,e = 0.001,N_Max = i)
    f2_N_R1.append(i)
    f2_value_at_roots_R1.append(val_at_root)



f2_N_R2 = []
f2_value_at_roots_R2 = []

for i in range(1,11):
    #print()
    #print("N_Max = {}".format(i))
    val_at_root = secant(f_num = 2,a = -10,b = 24,e = 0.001,N_Max = i)
    f2_N_R2.append(i)
    f2_value_at_roots_R2.append(val_at_root)


f1_value_at_roots_R1_ABS =  [abs(ele) for ele in f1_value_at_roots_R1]
f1_value_at_roots_R2_ABS =  [abs(ele) for ele in f1_value_at_roots_R2]
f2_value_at_roots_R1_ABS =  [abs(ele) for ele in f2_value_at_roots_R1]
f2_value_at_roots_R2_ABS =  [abs(ele) for ele in f2_value_at_roots_R2]


# change the data and use the following code
# to plot and save for both the Functions ABSOLUTE VALUES
plt.plot(f1_N_R1,f1_value_at_roots_R1_ABS,'.-',label = 'initial points : {20,-11}')
plt.plot(f1_N_R2,f1_value_at_roots_R2_ABS,'.-',label = 'initial points : {-10,24}')
plt.xlabel('N',fontsize = 10)
plt.ylabel('Function Value at Root',fontsize = 10)
plt.xticks(fontsize = 8)
plt.yticks(fontsize = 8)
plt.title('Secant Method - Function1 Absolute Value - permissible error : 0.001')
plt.grid(linestyle = '--')
plt.legend()
plt.savefig('secm-f1-abs.png')
plt.show()
