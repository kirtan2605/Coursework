from func import *

def left_endpoint(n,a,b):
    """
    returns the quadrature of function f(x)

    Input:
    1.n : number of segments the integral range is divided into
    2.a : lower limit of integral
    3.b : upper limito of integral
    """
    #calculating the thickness of each interval
    del_x = (b-a)/n

    num_integral = 0

    for i in range(n):
        func_val_left_endpoint = f(i*del_x)
        num_integral = num_integral + (func_val_left_endpoint*del_x)

    return num_integral
