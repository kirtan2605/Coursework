import numpy as np

def f(x):
    """
    returns the value of the function for some given x

    Inputs:
    1.x : Input value

    Output: Function value
    """
    return 3.0*x - 4

def bisection(a, b, e):
    """
    approximates a root, R, of f bounded by a and b
    with root being accurate enough such that |f(R)| < e

    Inputs:
    1. f : The function whose roots we want to find
    2. a : lower bound on the root
    3. b : upper bound on the root
    4. e : permissible error in the value of root obtained

    """

    # check if a and b bound a root
    # if they are of the same sign, then they do not bound a root
    if (f(a)*f(b))>0:
        raise Exception("The scalars a and b do not bound a root")
    # this works assuming that the function is monotonous in the range (a,b)

    # the midpoint of a and b
    m = (a + b)/2

    # if the found midpoint satisfies the accuracy requirement
    if np.abs(f(m)) < e:
        # stopping condition, report m as root
        print('the root obtained is {}'.format(m))
        return m
    # if the midpoint 'm' lies between the root and a,
    # we know that 'm' is closer to the root than a
    # this is the case where m is an improvement on a
    elif np.sign(f(a)) == np.sign(f(m)):
        # Make recursive call with a = m
        return bisection(m, b, e)
    # if the midpoint 'm' lies between the root and b,
    # we know that 'm' is closer to the root than b
    # this is the case where 'm' is an improvement on b
    elif np.sign(f(b)) == np.sign(f(m)):
        # Make recursive call with b = m
        return bisection(a, m, e)
