# demo on basics of functions in python

# As codes become larger, we are going to want to compartmentalize our codes

import math

def  my_func(x):
    """
    simple function that computes : sin(x) + 2x

    Inputs:
    1.x: input value (in radians)

    Output:
    returns y = sin(x) + 2x

    """

    y = math.sin(x) + 2.0*x

    return y
"""
to use the above function, we can use the import functions:
from file1 import my_func
"""

def welcome_msg():
    """
    function that says hello

    Inputs: None

    Output: A string
    """
    print("Entered the function")
    return "...oh no its another saturday.."

"""
Now this file has 2 functions : my_func, welcome_message()
We can import both of them individually using the above mentioned syntax
Or we can import all the functions together
from file1 import *
"""
