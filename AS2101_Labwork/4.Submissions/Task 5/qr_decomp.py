from gs_orth import *
import numpy as np


def qr_decomposition_solver(A,B):
    """
    function that takes arrays A,B of A.x = B and returns list x (top to bottom)
    this function does this using QR decomposition with Gram-Schmidt orthogonalization
    followed by back substitution

    Inputs: Lists A,B (converted to arrays in the function)

    Outputs: the list x
    """

    # perform Gram-Schmidt orthogonalization
    matrix = np.array(A)
    columns,on_basis_vec = gs_orthogonalization(matrix)
    # columns store the value of columns of matrix A
    # on_basis_vec stores the value of the orthonormal basis vectors
    # these vectors are obtained using Gram-Schmidt orthogonalization

    # perform QR decomposition
    # calculating Q
    Q_t = []
    for vector in on_basis_vec:
        # adding the orthonormal basis vectors as rows
        Q_t.append(vector.tolist())
    Q_t = np.array(Q_t)
    # to get orthonormalbasis vectors as columns, taking transpose
    Q = Q_t.T

    """
    # checking is Q is orthogonalization
    check = Q_t.dot(Q) #multiplying Q_transpose and Q to check determinant
    print( np.linalg.det(check))
    # output should be 1
    """
    # calculating R
    # initializing R matrix
    n_cols = matrix.shape[1]
    R = np.zeros((n_cols,n_cols))

    # populating the R matrix
    for i in range(n_cols):
        for j in range(i,n_cols):
            R[i][j] = np.dot(columns[j],on_basis_vec[i])

    # QR decomposition done

    """
    we know that : A.x = B is reduced using QR decomposition to : R.x = Q_t.B
    """
    RHS = Q_t.dot(np.array(B))

    # using back substitution to solve for co-efficients
    b = []
    b.append(RHS[n_cols-1]/R[n_cols-1][n_cols-1])
    for i in range(n_cols-2,-1,-1):
        val = RHS[i]
        for j in range(0,n_cols-1-i):
            val = val - (R[i][n_cols-1-j])*(b[j])
        b.append(val/R[i][i])

    # since we are using back substitution, we found bn first, then b_(n-1) upto b_0
    # thus the list b contains the coefficients in the reverse order
    # therefore, reversing the list to get the indexes to match their coefficient number
    b.reverse()

    return b
