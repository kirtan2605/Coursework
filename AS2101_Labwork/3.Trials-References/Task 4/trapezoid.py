from func import *

def trapezoid(n,a,b):
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
        """
        the trapezoid method is equivalent to assuming function to be linear
        and taking the value of midpoint as average of left and right endpoints
        """
        func_val_trapezoid = (f(i*del_x)+f((i+1)*del_x))*(0.5)
        num_integral = num_integral + (func_val_trapezoid*del_x)

    return num_integral
