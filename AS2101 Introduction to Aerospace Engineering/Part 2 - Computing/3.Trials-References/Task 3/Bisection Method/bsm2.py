import numpy as np

def f2(x):
    """
    returns the value of the function for some given x

    Inputs:
    1.x : Input value

    Output: Function value
    """
    return 3.0*x - 4

def bisection2(a, b, e, N_Max):
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
    if (f2(a)*f2(b))>0:
        raise Exception("The scalars a and b do not bound a root")
    # this works assuming that the function is monotonous in the range (a,b)

    # the midpoint of a and b
    m = (a + b)/2

    # if the maximum number of iterations has not been reached, continue
    while(counter>0):
        #print(counter)

        # if the found midpoint satisfies the accuracy requirement
        if np.abs(f2(m)) < e:
            # stopping condition, report m as root
            print('the root obtained is {}'.format(m))
            return m
        # if the midpoint 'm' lies between the root and a,
        # we know that 'm' is closer to the root than a
        # this is the case where m is an improvement on a
        elif np.sign(f2(a)) == np.sign(f2(m)):
            # Make recursive call with a = m
            return bisection2(m, b, e, counter-1)
        # if the midpoint 'm' lies between the root and b,
        # we know that 'm' is closer to the root than b
        # this is the case where 'm' is an improvement on b
        elif np.sign(f2(b)) == np.sign(f2(m)):
            # Make recursive call with b = m
            return bisection2(a, m, e, counter-1)

    if(counter==0):
        print('the root obtained is {}'.format(m))
        return m
