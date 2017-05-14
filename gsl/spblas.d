/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.spblas;
import gsl.math;
import gsl.vector;
import gsl.matrix;
import gsl.spmatrix;
import gsl.blas;

extern (C):

int gsl_spblas_dgemv (const CBLAS_TRANSPOSE_t TransA, const double alpha, const(gsl_spmatrix)* A, const(gsl_vector)* x, const double beta, gsl_vector* y);
int gsl_spblas_dgemm (const double alpha, const(gsl_spmatrix)* A, const(gsl_spmatrix)* B, gsl_spmatrix* C);
size_t gsl_spblas_scatter (const(gsl_spmatrix)* A, const size_t j, const double alpha, size_t* w, double* x, const size_t mark, gsl_spmatrix* C, size_t nz);