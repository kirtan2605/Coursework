from math import *
import numpy as np
import matplotlib.pyplot as plt

def OEW_parameters():
    W_MTOW = np.array([189830, 207000, 267619, 306247])       # W_MTOW in kgs
    W_OEW = np.array([78700, 84200, 107955, 119400])          # W_OEW in kgs

    y = np.array(np.log(W_OEW))
    x = np.array(np.log(W_MTOW))

    #find line of best fit
    c, log_a = np.polyfit(x, y, 1)

    plt.scatter(x, y)
    plt.scatter(x,y,label='Historic Data')
    plt.plot(x, c*x+log_a, label = 'Linear Curve Fit')
    plt.title('Empty Weight Analytical Expression Parameter Calculation', fontsize=12)
    plt.xlabel('Maximum Take-off Weight (in kg) (log-scale)', fontsize=12)
    plt.ylabel('Operational Empty Weight (in kg) (log-scale)', fontsize=12)
    plt.xticks(fontsize=12)
    plt.yticks(fontsize=12)
    plt.grid(True)
    plt.axis
    plt.legend()
    plt.show()

    a = exp(log_a)
    print("\nEmpty Weight Analytical Expression Parameters")
    print("a : ", a)
    print("c : ", c)


    c1, a1 = [round(c, 1), round(a, 1)]
    c2, a2 = [round(c, 2), round(a, 2)]
    c3, a3 = [round(c, 3), round(a, 3)]
    c4, a4 = [round(c, 4), round(a, 4)]


    plt.scatter(x,y, label='Historic Data')
    plt.plot(x, c*x+log(a), label = 'Linear Curve Fit')
    plt.plot(x, c1*x+log(a1), linewidth = 0.5, label = 'First Decimal Approximation')
    plt.plot(x, c2*x+log(a2), linewidth = 0.5, label = 'Second Decimal Approximation')
    plt.plot(x, c3*x+log(a3), linewidth = 0.5, label = 'Third Decimal Approximation')
    plt.plot(x, c4*x+log(a4), linewidth = 0.5, label = 'Fourth Decimal Approximation')
    plt.title('Empty Weight Analytical Expression Parameter Calculation', fontsize=12)
    plt.xlabel('Maximum Take-off Weight (in kg) (log-scale)', fontsize=12)
    plt.ylabel('Operational Empty Weight (in kg) (log-scale)', fontsize=12)
    plt.xticks(fontsize=12)
    plt.yticks(fontsize=12)
    plt.grid(True)
    plt.axis
    plt.legend()
    plt.show()

    plt.scatter(W_MTOW/1000, W_OEW/1000, label='Historic Data')
    plt.plot(W_MTOW/1000, a*(W_MTOW**c)/1000, label = 'Linear Curve Fit')
    plt.plot(W_MTOW/1000, a1*(W_MTOW**c1)/1000, linewidth = 0.5, label = 'First Decimal Approximation')
    plt.plot(W_MTOW/1000, a2*(W_MTOW**c2)/1000, linewidth = 0.5, label = 'Second Decimal Approximation')
    plt.plot(W_MTOW/1000, a3*(W_MTOW**c3)/1000, linewidth = 0.5, label = 'Third Decimal Approximation')
    plt.plot(W_MTOW/1000, a4*(W_MTOW**c4)/1000, linewidth = 0.5, label = 'Fourth Decimal Approximation')
    plt.title('Empty Weight Analytical Expression Parameter Calculation', fontsize=12)
    plt.xlabel('Maximum Take-off Weight (in tonne)', fontsize=12)
    plt.ylabel('Operational Empty Weight (in tonne)', fontsize=12)
    plt.xticks(fontsize=12)
    plt.yticks(fontsize=12)
    plt.grid(True)
    plt.axis
    plt.legend()
    plt.show()


def new_OEW_parameters():
    W_PP = np.array([12700, 15600, 20400, 20400])
    W_STR = np.array([66000, 68600, 87555, 99000])
    percentage_reduction = 20
    W_STR_new = W_STR*(1 - (percentage_reduction/100))
    print(W_STR_new)

    W_OEW_new = W_PP + W_STR_new       # W_OEQ in kgs
    print(W_OEW_new)
    W_MTOW = np.array([189830, 207000, 267619, 306247])       # W_MTOW in kgs

    y = np.array(np.log(W_OEW_new))
    x = np.array(np.log(W_MTOW))

    #find line of best fit
    c, log_a = np.polyfit(x, y, 1)

    plt.scatter(x, y)
    plt.scatter(x,y,label='Updated Historic Data')
    plt.plot(x, c*x+log_a, label = 'Linear Curve Fit')
    plt.title('Empty Weight Analytical Expression Parameter Calculation', fontsize=12)
    plt.xlabel('Maximum Take-off Weight (in kg) (log-scale)', fontsize=12)
    plt.ylabel('Updated Operational Empty Weight (in kg) (log-scale)', fontsize=12)
    plt.xticks(fontsize=12)
    plt.yticks(fontsize=12)
    plt.grid(True)
    plt.axis
    plt.legend()
    plt.show()

    a = exp(log_a)
    print("\nEmpty Weight Analytical Expression Parameters")
    print("a : ", a)
    print("c : ", c)

    c1, a1 = [round(c, 1), round(a, 1)]
    c2, a2 = [round(c, 2), round(a, 2)]
    c3, a3 = [round(c, 3), round(a, 3)]
    c4, a4 = [round(c, 4), round(a, 4)]


    plt.scatter(x,y, label='Updated Historic Data')
    plt.plot(x, c*x+log(a), label = 'Linear Curve Fit')
    plt.plot(x, c1*x+log(a1), linewidth = 0.5, label = 'First Decimal Approximation')
    plt.plot(x, c2*x+log(a2), linewidth = 0.5, label = 'Second Decimal Approximation')
    plt.plot(x, c3*x+log(a3), linewidth = 0.5, label = 'Third Decimal Approximation')
    plt.plot(x, c4*x+log(a4), linewidth = 0.5, label = 'Fourth Decimal Approximation')
    plt.title('Empty Weight Analytical Expression Parameter Calculation', fontsize=12)
    plt.xlabel('Maximum Take-off Weight (in kg) (log-scale)', fontsize=12)
    plt.ylabel('Updated Operational Empty Weight (in kg) (log-scale)', fontsize=12)
    plt.xticks(fontsize=12)
    plt.yticks(fontsize=12)
    plt.grid(True)
    plt.axis
    plt.legend()
    plt.show()

    plt.scatter(W_MTOW/1000, W_OEW_new/1000, label='Updated Historic Data')
    plt.plot(W_MTOW/1000, a*(W_MTOW**c)/1000, label = 'Linear Curve Fit')
    plt.plot(W_MTOW/1000, a1*(W_MTOW**c1)/1000, linewidth = 0.5, label = 'First Decimal Approximation')
    plt.plot(W_MTOW/1000, a2*(W_MTOW**c2)/1000, linewidth = 0.5, label = 'Second Decimal Approximation')
    plt.plot(W_MTOW/1000, a3*(W_MTOW**c3)/1000, linewidth = 0.5, label = 'Third Decimal Approximation')
    plt.plot(W_MTOW/1000, a4*(W_MTOW**c4)/1000, linewidth = 0.5, label = 'Fourth Decimal Approximation')
    plt.title('Empty Weight Analytical Expression Parameter Calculation', fontsize=12)
    plt.xlabel('Maximum Take-off Weight (in tonne)', fontsize=12)
    plt.ylabel('Updated Operational Empty Weight (in tonne)', fontsize=12)
    plt.xticks(fontsize=12)
    plt.yticks(fontsize=12)
    plt.grid(True)
    plt.axis
    plt.legend()
    plt.show()

OEW_parameters()

new_OEW_parameters()