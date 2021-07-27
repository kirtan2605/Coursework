import numpy as np
import matplotlib.pyplot as plt

def lin_reg_coef(x_list, y_list):
    """
    function that returns Linear Regression coefficients

    Inputs:
    1. x_list : list of data on x-axis
    2. y_list : list of data on y-axis

    Output: Tuple of Linear Regression Coefficients
    """
    # converting the list into array
    x = np.array(x_list)
    y = np.array(y_list)
    
    # number of observations/points
    n = np.size(x)

    # mean of x and y vector
    m_x = np.mean(x)
    m_y = np.mean(y)

    # calculating cross-deviation and deviation about x
    SS_xy = np.sum(y*x) - n*m_y*m_x
    SS_xx = np.sum(x*x) - n*m_x*m_x

    # calculating regression coefficients
    b_1 = SS_xy / SS_xx
    b_0 = m_y - b_1*m_x
    #c = b_0, m = b_1 in y=mx+c
    return (b_0, b_1)
