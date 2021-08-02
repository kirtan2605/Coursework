import numpy as np
import time    # check documentation for further use
import matplotlib.pyplot as plt
from qr_decomp import *
from mat_inversion_method import *

# Import and Store the Data
x_data = []
y_data = []

filename = 'data1.txt'
data = np.loadtxt(filename, delimiter=' ', dtype=float)
x_data = data[:,0]
y_data = data[:,1]


# PART 1

# Form the required Matrix
A = []
for data_point in x_data:
    A.append([1, data_point, data_point*data_point])
B = y_data


# Finding COEFFICIENTS, TIME TAKEN and ERROR
## finding coefficients using QR Decomposition while noting time
t1 = time.time()    # works like a stop-watch
b_qr_decomp = qr_decomposition_solver(A,B)
t2 = time.time()
# thus time taken by QR decomposition approach is t2-t1
time1_in_milli_sec = (t2-t1)*(10**3)
print("time taken when solved by QR decomposition : %.5f ms" % time1_in_milli_sec)
print(b_qr_decomp)

#WHY DOES THIS SHOW A SLIGHTLY DIFFERENT TIME EVERYTIME
#in the result, show a range of values of time


## finding coefficients using Matrix Inversion while noting time
t3 = time.time()
b_mat_inversion = mat_inv_method(A,B)
t4 = time.time()
# thus time taken by matrix inversion approach is t4-t3
time2_in_milli_sec = (t4-t3)*(10**3)
print("time taken when solved by Matrix inversion : %.5f ms" % time2_in_milli_sec)
print(b_mat_inversion)

# Calculating the ERROR in each methods
# We will evaluate the accuracy of the models based on r r-squared values
# we can directly compare the errors, but for uniformity of evaluation wrt different models
# we will compare the results based on r-squared values
rms_data = 0
rms_qr = 0
rms_mi = 0

# predicted values y_cap
#QR Decomposition
y1_cap = [(b_qr_decomp[2]*(i**2) + b_qr_decomp[1]*i + b_qr_decomp[0]) for i in x_data]
#Matrix Inversion
y2_cap = [(b_mat_inversion[2]*(i**2) + b_mat_inversion[1]*i + b_mat_inversion[0]) for i in x_data]

y_bar = B.mean()

#finding rms error in data
for element in B:
    rms_data = rms_data + ((element-y_bar)**2)

# finding rms errors in both methods
for element in y1_cap:
    rms_qr = rms_qr + ((element-y_bar)**2)
for element in y2_cap:
    rms_mi = rms_mi + ((element-y_bar)**2)

r_squared_qr = rms_qr/rms_data
r_squared_mi = rms_mi/rms_data
print("R-square for QR method Regression: {}".format(r_squared_qr))
print("R-square for Matrix Inversion method Regression: {}".format(r_squared_mi))



# PART 2
# finding terms for biquadratic regression equation

# Finding COEFFICIENTS, TIME TAKEN and ERROR
## finding coefficients using QR Decomposition
A = []
for data_point in x_data:
    A.append([1, data_point, data_point**2, data_point**3, data_point**4])
t5 = time.time()
b_biquadratic_qr_decomp = qr_decomposition_solver(A,B)
t6 = time.time()
time3_in_milli_sec = (t6-t5)*(10**3)
print("time taken when solved for biquadratic regression using QR method is : %.5f ms" % time3_in_milli_sec)
print(b_biquadratic_qr_decomp)

# calculating the fit of the model using R-square value
y_bar = B.mean()
y_biquad_cap = [(b_biquadratic_qr_decomp[4]*(i**4) + b_biquadratic_qr_decomp[3]*(i**3) + b_biquadratic_qr_decomp[2]*(i**2) + b_biquadratic_qr_decomp[1]*i + b_biquadratic_qr_decomp[0]) for i in x_data]
rms_biquad_qr = 0
for element in y_biquad_cap :
    rms_biquad_qr = rms_biquad_qr + ((element-y_bar)**2)
r_squared_bq = rms_biquad_qr/rms_data
print("R-square for Biquadratic Regression: {}".format(r_squared_bq))


"""
# PRINTING AND SAVING THE PLOTS

x_axis = [j for j in range(0,11,1) ]
y1_axis = [(b_qr_decomp[2]*(i**2) + b_qr_decomp[1]*i + b_qr_decomp[0]) for i in x_axis]
y2_axis = [(b_mat_inversion[2]*(i**2) + b_mat_inversion[1]*i + b_mat_inversion[0]) for i in x_axis]
y_biquad_axis = [(b_biquadratic_qr_decomp[4]*(i**4) + b_biquadratic_qr_decomp[3]*(i**3) + b_biquadratic_qr_decomp[2]*(i**2) + b_biquadratic_qr_decomp[1]*i + b_biquadratic_qr_decomp[0]) for i in x_axis]

plt.scatter(x_data,y_data,marker = '.')
plt.plot(x_axis, y1_axis,label='QR Decomposition')
plt.plot(x_axis, y2_axis,label='Matrix Inversion')
plt.plot(x_axis, y_biquad_axis,label='Biquadratic Regression')
#plt.title('Least Squares Plot')
plt.xlabel('x')
plt.ylabel('y')
plt.legend(loc='best')
plt.grid()
plt.savefig('Task5.png')
plt.show()
"""
