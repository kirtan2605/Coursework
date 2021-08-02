import numpy as np
from mat_inversion import *


def mat_inv_method(A,B):
    """
    function that takes arrays A,B of A.x = B and returns list x (top to bottom)
    this function does this using matrix inversion

    Inputs: Lists A,B (converted to arrays in the function)

    Outputs: the list x
    """

    # A.x = B but since A is not a square matrix, we can not find the inverse
    # pre-multiply by A-transpose
    # new_A.x = new_B where new_A = (A^T).A and new_B = (A^T).B
    A = np.array(A)
    B = np.array(B)
    A_t = A.transpose()
    new_A = A_t.dot(A)
    new_B = A_t.dot(B)
    new_A_inverse = invert_matrix(new_A)

    # (A_inverse).A.x = (A_inverse).B
    # x = (A_inverse).B

    b = new_A_inverse.dot(new_B)

    return b
