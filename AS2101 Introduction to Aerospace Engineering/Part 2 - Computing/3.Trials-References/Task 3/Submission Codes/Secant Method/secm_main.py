from secm import *

N_list, f_values = secant(a = -3, b = 0, e = 0.001, N_max = 15)

print(N_list)
print(f_values)
