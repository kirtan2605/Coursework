

def f(x):
    """
        Defining Function
    """
    return x**3 - 2*x + 2

def g(x):
    """
    Defining derivative of function
    """
    return 3*x**2 - 2


def newtonRaphson(x0,e,N):
    """
    Implementing Newton Raphson Method
    """
    func_value_at_roots = []
    counter = 1
    flag = 1
    condition = True
    #print('Iteration:{}, x1 = {} and f(x1) = {}'.format(0, x0, f(x0)))
    while condition:
        if g(x0) == 0.0:
            print('Divide by zero error!')
            break

        x1 = x0 - f(x0)/g(x0)
        #print('Iteration:{}, x1 = {} and f(x1) = {}'.format(counter, x1, f(x1)))
        func_value_at_roots.append((f(x1)))
        x0 = x1
        counter = counter + 1

        if counter > N:
            flag = 0
            break

        condition = abs(f(x1)) > e
    return func_value_at_roots
"""
    if flag==1:
        print('\nRequired root is: %0.8f' % x1)
    else:
        print('\nNot Convergent.')
"""
