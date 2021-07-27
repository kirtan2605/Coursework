import math

def f(func_value,x):
    """
        Defining Function
    """
    if int(func_value) == 1 :
        return (x**3 - 3*(x**2) - x + 9)
    elif int(func_value) == 2 :
        return (x**3 - 3*(x**2) - x + 9)*(math.exp(x))
    else:
        print("Error Message")

def secant(f_num,a,b,e,N_Max):
    f_a = f(f_num,a)
    f_b = f(f_num,b)
    counter = 0
    while abs(f_b)>e and counter<N_Max :
        try:
            numerical_derivate = (f_b - f_a)/(b-a)
            t2 = b - f(f_num,b)/numerical_derivate
        except:
            print("error")
        a = b
        b = t2
        f_a = f_b
        f_b = f(f_num,b)
        counter += 1
    return f_b
