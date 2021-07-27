import numpy as np
import math

def f(func_value, x):
    """
    returns the value of the function for some given x

    Inputs:
    1.x : Input value

    Output: Function value
    """
    if int(func_value) == 1 :
        return (x**3 - 3*(x**2) - x + 9)
    elif int(func_value) == 2 :
        return (x**3 - 3*(x**2) - x + 9)*(math.exp(x)))
    else:
        print("Error Message")

def bisection(func_num,a, b, e, N_Max):
    """
    approximates a root, R, of f bounded by a and b
    with root being accurate enough such that |f(R)| < e

    Inputs:
    1. f : The function whose roots we want to find
    2. a : lower bound on the root
    3. b : upper bound on the root
    4. e : permissible error in the value of root obtained
    5. N_max : maximum number of iterations after which function stops.

    """
    counter = N_Max
    # this is the maximum number of times the function can be called

    # check if a and b bound a root
    # if they are of the same sign, then they do not bound a root
    """
    if ((f(func_num,a))*(f(func_num,b)))>0 :
        raise Exception("The scalars a and b do not bound a root")
    """
    # this works assuming that the function is monotonous in the range (a,b)

    # the midpoint of a and b
    m = (a + b)/2

    # if the maximum number of iterations has not been reached, continue
    while(counter>0):
        #print(counter)

        # if the found midpoint satisfies the accuracy requirement
        if np.abs(f(func_num,m)) < e:
            # stopping condition, report m as root
            #print('the root obtained is {}'.format(m))
            return m
        # if the midpoint 'm' lies between the root and a,
        # we know that 'm' is closer to the root than a
        # this is the case where m is an improvement on a
        elif np.sign(f(func_num,a)) == np.sign(f(func_num,m)):
            # Make recursive call with a = m
            return bisection(func_num, m, b, e, counter-1)
        # if the midpoint 'm' lies between the root and b,
        # we know that 'm' is closer to the root than b
        # this is the case where 'm' is an improvement on b
        elif np.sign(f(func_num,b)) == np.sign(f(func_num,m)):
            # Make recursive call with b = m
            return bisection(func_num, a, m, e, counter-1)

    if(counter==0):
        #print('the root obtained is {}'.format(m))
        return m
