"""
typically we follow a 2-stage process while writing a codes
we use a script that calls other functions
"""


"""
from fib import fib_term
# enter the number of terms in the FibonacciSeries
nterm = 40

#call a function that prints out the nth term
f1 = fib_term(nterm)
print("-- the [Original] term {} is {}".format(nterm,f1))

f2 = fib_term_v2(nterm)
print("-- the [Modified] term {} is {}".format(nterm,f2))
"""
# instead of just seeing the result, we can see the runtime efficiency .
# we can use the time module to keep a track of the time.

from fib import *    # importing all the functions from fib.py
# using * also imports all the global variables (fin_array)
import time    # check documentation for further use
# enter the number of terms in the FibonacciSeries
nterm = 10

#call a function that prints out the nth term
t1 = time.time()    # works like a stop-watch
f1 = fib_term(nterm)
t2 = time.time()
print("-- the [Original] term {} is {}, computation time[s] {}".format(nterm,f1,t2-t1))

t1 = time.time()
f2 = fib_term_v2(nterm)
t2 = time.time()
print("-- the [Modified] term {} is {}, computation time[s] {}".format(nterm,f2,t2-t1))

# we can even print the fibonacci series wince we are anyways storing it
print('-- the fibonacci series stored in the fib array is',fib_array)
# go through the 'while' and 'for' loop
