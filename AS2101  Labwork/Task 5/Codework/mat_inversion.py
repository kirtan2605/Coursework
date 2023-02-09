import numpy as np

def invert_matrix(mat_to_be_inverted):
    """
    Returns the inverse of the passed in matrix.
        :param A: The matrix to be inversed

        :return: The inverse of the matrix A
    """
    # assuming matrix to be invertible

    # Section 2: Make copies of A & I, AM & IM, to use for row ops
    n = len(mat_to_be_inverted)
    AM = mat_to_be_inverted.copy()
    I = np.identity(n)
    IM = I.copy()

    # Section 3: Perform row operations
    indices = list(range(n)) # to allow flexible row referencing ***
    for fd in range(n): # fd stands for focus diagonal
        fdScaler = 1.0 / AM[fd][fd]
        # FIRST: scale fd row with fd inverse.
        for j in range(n): # Use j to indicate column looping.
            AM[fd][j] *= fdScaler
            IM[fd][j] *= fdScaler
        # SECOND: operate on all rows except fd row as follows:
        for i in indices[0:fd] + indices[fd+1:]:
            # *** skip row with fd in it.
            crScaler = AM[i][fd] # cr stands for "current row".
            for j in range(n):
                # cr - crScaler * fdRow, but one element at a time.
                AM[i][j] = AM[i][j] - crScaler * AM[fd][j]
                IM[i][j] = IM[i][j] - crScaler * IM[fd][j]
    """
    # check is inverted matrix is correct
    print("this should be I")
    print(IM.dot(mat_to_be_inverted))
    """
    return IM
