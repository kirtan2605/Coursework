import numpy as np
import matplotlib.pyplot as plt
from l_endpoint import *
from r_endpoint import *
from midpoint import *
from trapezoid import *
from lin_reg import *


"""
script to call functions and find error wrt true value

integral = int(0,pi/2) [sin(x)]

true_value of integral = 1
"""
lower_limit = 0
upper_limit = np.pi/2

absolute_error_l_endpoint = []
absolute_error_r_endpoint = []
absolute_error_midpoint = []
absolute_error_trapezoid = []

# iterating through the number of divisions in which the integration range is divided
# and calculating absolute error in the integration calculated using different methods
for divisions in range(10,21):
    absolute_error_l_endpoint.append(abs(left_endpoint(divisions, lower_limit, upper_limit)-1))
    absolute_error_r_endpoint.append(abs(right_endpoint(divisions, lower_limit, upper_limit)-1))
    absolute_error_midpoint.append(abs(midpoint(divisions, lower_limit, upper_limit)-1))
    absolute_error_trapezoid.append(abs(trapezoid(divisions, lower_limit, upper_limit)-1))

log_absolute_error_l_endpoint = []
log_absolute_error_r_endpoint = []
log_absolute_error_midpoint = []
log_absolute_error_trapezoid = []

log_absolute_error_l_endpoint = [np.log(ele) for ele in absolute_error_l_endpoint]
log_absolute_error_r_endpoint = [np.log(ele) for ele in absolute_error_r_endpoint]
log_absolute_error_midpoint = [np.log(ele) for ele in absolute_error_midpoint]
log_absolute_error_trapezoid = [np.log(ele) for ele in absolute_error_trapezoid]

x_axis = []
for i in range(10,21):
    x_axis.append((upper_limit - lower_limit)/i)

# to plot and save for all methods absolute errors  (change to plot absolute_error and log_absolute_error)
"""
plt.plot(x_axis,log_absolute_error_l_endpoint,'.-',label = 'Left Endpoint')
plt.plot(x_axis,log_absolute_error_r_endpoint,'.-',label = 'Right Endpoint')
plt.plot(x_axis,log_absolute_error_midpoint,'.-',label = 'Midpoint')
plt.plot(x_axis,log_absolute_error_trapezoid,'.-',label = 'Trapezoid')
plt.xlabel('delta_x',fontsize = 10)
plt.ylabel('log(Absolute Error)',fontsize = 10)
plt.xticks(fontsize = 8)
plt.yticks(fontsize = 8)
plt.title('log(Absolute Error) vs delta_x')
plt.grid(linestyle = '--')
plt.legend()
plt.savefig('log_abs_error.png')
plt.show()
"""

# Calculating Linear Regression for the Data
# the lin_reg_coef() returns a tuple of linear regression Coefficients
"""
# You can regress a line through those points using:
fit = np.polyfit(x,y,deg=1)
# and plot the line using:
ax.plot(x, fit[0] * x + fit[1])
"""

l_endpoint_coef = lin_reg_coef(x_axis,log_absolute_error_l_endpoint)
r_endpoint_coef = lin_reg_coef(x_axis,log_absolute_error_r_endpoint)
midpoint_coef = lin_reg_coef(x_axis,log_absolute_error_midpoint)
trapezoid_coef = lin_reg_coef(x_axis,log_absolute_error_trapezoid)

y_lep = [l_endpoint_coef[1]*ele + l_endpoint_coef[0] for ele in x_axis]
y_rep = [r_endpoint_coef[1]*ele + r_endpoint_coef[0] for ele in x_axis]
y_mp = [midpoint_coef[1]*ele + midpoint_coef[0] for ele in x_axis]
y_trp = [trapezoid_coef[1]*ele + trapezoid_coef[0] for ele in x_axis]

# to plot and save linear regression for all methods absolute errors vs delta-x
"""
plt.scatter(x_axis,log_absolute_error_l_endpoint,marker = 'o')
plt.scatter(x_axis,log_absolute_error_r_endpoint,marker ='o')
plt.scatter(x_axis,log_absolute_error_midpoint,marker ='o')
plt.scatter(x_axis,log_absolute_error_trapezoid,marker ='o')
plt.plot(x_axis, y_lep, label='Rectangular Left Endpoint Method')
plt.plot(x_axis, y_rep, label='Rectangular Right Endpoint Method')
plt.plot(x_axis, y_mp, label='Rectangular Midpoint Method')
plt.plot(x_axis, y_trp, label='Trapezoid Method')
plt.title('log(Absolute Error) vs delta_x - Linear Regression')
plt.xlabel('delta_x', color='#1C2833')
plt.ylabel('log(Absolute Error)', color='#1C2833')
plt.legend(loc='best')
plt.grid()
plt.savefig('log_error_vs_delta_x_Lin_Reg.png')
plt.show()
"""

# to plot and save for absolute errors vs number of subintervals
"""
plt.plot(range(10,21),absolute_error_l_endpoint,'.-',label = 'Left Endpoint')
plt.plot(range(10,21),absolute_error_r_endpoint,'.-',label = 'Right Endpoint')
plt.xlabel('number of subintervals in the integration interval',fontsize = 10)
plt.ylabel('Absolute Error',fontsize = 10)
plt.xticks(fontsize = 8)
plt.yticks(fontsize = 8)
plt.title('Absolute Error vs no. of subintervals')
plt.grid(linestyle = '--')
plt.legend()
plt.savefig('abs_error_vs_num_subintervals.png')
plt.show()
"""
