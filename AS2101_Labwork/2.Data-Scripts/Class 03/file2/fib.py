# functions related to the Fibonacci Series

# 1 1 2 3 5 8 13 22 ....
# f(n) = f(n-1) + f(n-2)

def fib_term(n):
    """
    a function that returns the nth term of Fibonaaci Series

    Inputs:
    1.n: integer

    Output: An Integer
    """

    if n==1:
        return 1
    elif n==2:      # elif stands for "else if"
        return 1
    else:
        # using recursion
        return fib_term(n-1)+fib_term(n-2)
"""
For higher values of n, this code takes quite some time to return,
This is because the function is running many times for the same value of n
i.e even after already having calculated the value of fib_term(n) for some n
in the computation cycle before, the function is recalculating it.

To make it faster, we can store the values which we have computed in the previous
computational cycles. This is where we use Dynamic Programming
"""

# populating the array initially
fib_array = [1,1]
# we can even use a dictionary to store the fibonacci terms

def fib_term_v2(n):
    """
    a function that stores the value of terms that have been calculated before

    Inputs:
    1.n: Integer

    Output: An Integer
    """

    # if the element exists, then just fetch it and return the values

    if n <= len(fib_array):
        return fib_array[n-1] # since python is BASE 0 !!
    else:
        tmp_value= fib_term_v2(n-1) + fib_term_v2(n-2)
        fib_array.append(tmp_value)
        return tmp_value
