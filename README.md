# Code linear algebra in MATLAB
- [A function that sets a given matrix to a zero matrix, by assigning a zero column at a time](ZeroMatrix_unb.m)

- [A function that sets a given matrix to an identity matrix, by expanding the top left quadrant by one row and one column at a time](Set_to_identity_unb.m)

- [A function that sets a given matrix to a diagonal matrix, by expanding the top left quadrant by one row and one column of a matrix at a time and expanding the top part by one row of a vector at a time](Set_to_diagonal_matrix_unb.m)

- [A function that sets a given matrix to a upper triangular matrix, by expanding the top left quadrant by one row and one column at a time](Set_to_upper_triangular_matrix_unb.m)

- [A function that sets a given matrix to a strictly upper triangular matrix, by expanding the top left quadrant by one row and one column at a time](Set_to_strictly_upper_triangular_matrix_unb.m)

- [A function that sets a given matrix to a unit upper triangular matrix, by expanding the top left quadrant by one row and one column at a time](Set_to_unit_upper_triangular_matrix_unb.m)

- [A function that sets a given matrix to a lower triangular matrix, by expanding the top left quadrant by one row and one column at a time](Set_to_lower_triangular_matrix_unb.m)

- [A function that sets a given matrix to a strictly lower triangular matrix, by expanding the top left quadrant by one row and one column at a time](Set_to_strictly_lower_triangular_matrix_unb.m)

- [A function that sets a given matrix to a unit lower triangular matrix, by expanding the top left quadrant by one row and one column at a time](Set_to_unit_lower_triangular_matrix_unb.m)

- [A function that transposes a given matrix, by expanding the left part of an input matrix by one column and the top part of another input matrix by one row at a time](Transpose_unb.m)

- [A function that transposes a given matrix, by expanding the top part of an input matrix by one row and the left part of another input matrix by one column at a time](Transpose_alternative_unb.m)

- [A function that symmetrizes a given matrix from the lower triangle matrix, by expanding the top left quadrant by one row and one column at a time](Symmetrize_from_lower_triangle_unb.m)

- [A function that symmetrizes a given matrix from the upper triangle matrix, by expanding the top left quadrant by one row and one column at a time](Symmetrize_from_upper_triangle_unb.m)

- [A function that scales a given matrix, by scaling a column at a time](Scale_matrix_unb.m)

- [A function that adds two given matrices, by adding two columns at a time](Add_matrices_unb.m)

- [A function that multiplies a matrix and a vector using the dot-product of rows of the matrix with the vector, by one row of the matrix at a time](Mvmult_n_unb_var1.m)

- [A function that multiplies a matrix and a vector using the linear combination of the columns of this given matrix, by one column of the matrix at a time](Mvmult_n_unb_var2.m)

- [A function that multiplies a matrix and a vector using the partitioned dot-product of rows of the matrix with the vector](Mvmult_n_unb_var1B.m)

- [A function that multiplies a matrix and a vector using the partitioned linear combination (AXPY) of the columns of this given matrix](Mvmult_n_unb_var2B.m)

- [A function that multiplies a transposed matrix and a vector using the dot-product of columns of the original matrix with the vector, by one column of the original matrix at a time](Mvmult_t_unb_var1.m)

- [A function that multiplies a transposed matrix and a vector using the linear combination of the rows of the original matrix, by one row of the original matrix at a time](Mvmult_t_unb_var2.m)

*Note*: For the matrix-vector multiplication of Ax + y, choose the algorithm that uses linear combination (AXPY operations), since AXPY operations access a matrix by columns and this way of subsetting a matrix tends to be faster than an algorithm that accesses a matrix by rows. However, for the matrix-vector multiplication of A^Tx + y, choose the algorithm that uses dot products, because these dot product operations access a matrix by columns.

- [A function that multiplies a upper triangular matrix and a vector using the partitioned dot-product of rows of the matrix with the vector, by expanding the top left quadrant by one row and one column at a time](Trmvp_un_unb_var1.m)

- [A function that multiplies a upper triangular matrix and a vector using the partitioned linear combination (AXPY) of the columns of this given matrix, by expanding the top left quadrant by one row and one column at a time](Trmvp_un_unb_var2.m)

- [A function that multiplies a upper triangular matrix and a vector using the partitioned dot-product of rows of the matrix with the vector, by expanding the top left quadrant by one row and one column at a time, and overwriting the input vector without using work space](Trmv_un_unb_var1.m)

- [A function that multiplies a upper triangular matrix and a vector using the partitioned linear combination (AXPY) of the columns of this given matrix, by expanding the top left quadrant by one row and one column at a time, and overwriting the input vector without using work space](Trmv_un_unb_var2.m)

- [A function that multiplies a lower triangular matrix and a vector using the partitioned dot-product of rows of the matrix with the vector, by expanding the top left quadrant by one row and one column at a time, and overwriting the input vector without using work space](Trmv_ln_unb_var1.m)

- [A function that multiplies a lower triangular matrix and a vector using the partitioned linear combination (AXPY) of the columns of this given matrix, by expanding the top left quadrant by one row and one column at a time, and overwriting the input vector without using work space](Trmv_ln_unb_var2.m)


