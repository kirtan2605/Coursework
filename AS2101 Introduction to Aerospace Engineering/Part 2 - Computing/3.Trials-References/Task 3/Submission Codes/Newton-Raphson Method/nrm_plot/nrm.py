import numpy as np
import math

def f(func_value, x):
    """
        Defining Function
    """
    if int(func_value) == 1 :
        return (x**3 - 3*x*x - x + 9)
    elif int(func_value) == 2 :
        return ((x**3 - 3*x*x - x + 9)*(math.exp(x)))
    else:
        print("Error Message")

def g(func_value, x):
    """
    Defining derivative of function
    """
    if int(func_value) == 1 :
        return (3*x*x - 6*x - 1)
    elif int(func_value) == 2 :
        return ((x**3 - 3*x*x - x + 9 + (3*x*x - 6*x - 1))*(math.exp(x)))
    else:
        print("Error Message")


def newtonRaphson(func_num,x0,e,N):
    """
        Implementing Newton Raphson Method
    """
    func_value_at_roots = []
    counter = 1
    flag = 1
    condition = True
    while condition:
        if g(func_num,x0) == 0.0:
            print('Divide by zero error!')
            break

        x1 = x0 - f(func_num,x0)/g(func_num,x0)
        #print('Iteration:{}, x1 = {} and f(x1) = {}'.format(counter, x1, f(func_num,x1)))
        func_value_at_roots.append((f(func_num,x1)))
        x0 = x1
        counter = counter + 1

        if counter > N:
            flag = 0
            break

        condition = abs(f(func_num,x1)) > e
    return func_value_at_roots
"""
    if flag==1:
        print('Required root is:{}'.format(x1))
        continue
    else:
        print('Not Convergent.')
"""
