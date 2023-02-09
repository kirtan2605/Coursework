import numpy as np
import math

def normalize(column):
    """
    this function takes a array and normalizes it

    input : array

    output : normalized array
    """
    sq_sum = 0
    for ele in column:
        sq_sum = sq_sum + (ele*ele)
    norm_column = column/math.sqrt(sq_sum)

    return norm_column



def gs_orthogonalization(A):
    """
    this functions performs GS orthogonalization on a matrix

    Input:
    1.A : Matrix Array

    Output:
    1.cols : columns of the input matrix
    2.on_basis : orthonormal basis found using Gram-Schmidt orthogonalization
    """
    # consider the vectors to be the columns of the matrix A.
    num_col = A.shape[1]
    cols = []
    for i in range(num_col):
        cols.append(np.array((A[:,i])))

    on_basis = []
    on_basis.append(normalize(cols[0]))

    for i in range(1,num_col):
        #finding new orthonormalbase
        new_base = cols[i]
        for element in on_basis :
             new_base = new_base - np.array(np.dot(cols[i],element)*element)
        on_basis.append(normalize(new_base))
    #  after this the on_basis contain the orthonormal basis vectors as arrays
    return cols,on_basis
