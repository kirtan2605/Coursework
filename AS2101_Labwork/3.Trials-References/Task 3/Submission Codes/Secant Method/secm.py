
def f(x):
    """
        Defining Function
    """
    return x**3 - 3*(x**2) - x + 9

def secant(a,b,e,N_max):
    N = []
    func_at_root = []
    f_a = f(a)
    f_b = f(b)
    counter = 0
    while abs(f_b)>e and counter<N_max :
        try:
            numerical_derivate = (f_b - f_a)/(b-a)
            t2 = b - f(b)/numerical_derivate
        except:
            print("error")
        a = b
        b = t2
        f_a = f_b
        f_b = f(b)
        counter += 1
        N.append(counter)
        func_at_root.append(f_b)
    return N,func_at_root
