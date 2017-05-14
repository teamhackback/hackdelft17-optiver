/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.multilarge;
import gsl.math;
import gsl.vector;
import gsl.matrix;

extern (C):

extern __gshared const(gsl_multilarge_linear_type)* gsl_multilarge_linear_normal;
extern __gshared const(gsl_multilarge_linear_type)* gsl_multilarge_linear_tsqr;

struct gsl_multilarge_linear_type
{
    const(char)* name;
    void* function (const size_t) alloc;
    int function (void*) reset;
    int function (gsl_matrix*, gsl_vector*, void*) accumulate;
    int function (const double, gsl_vector*, double*, double*, void*) solve;
    int function (double*, void*) rcond;
    int function (gsl_vector*, gsl_vector*, gsl_vector*, void*) lcurve;
    void function (void*) free;
}

struct gsl_multilarge_linear_workspace
{
    const(gsl_multilarge_linear_type)* type;
    void* state;
    size_t p;
}

gsl_multilarge_linear_workspace* gsl_multilarge_linear_alloc (const(gsl_multilarge_linear_type)* T, const size_t p);
void gsl_multilarge_linear_free (gsl_multilarge_linear_workspace* w);
const(char)* gsl_multilarge_linear_name (const(gsl_multilarge_linear_workspace)* w);
int gsl_multilarge_linear_reset (gsl_multilarge_linear_workspace* w);
int gsl_multilarge_linear_accumulate (gsl_matrix* X, gsl_vector* y, gsl_multilarge_linear_workspace* w);
int gsl_multilarge_linear_solve (const double lambda, gsl_vector* c, double* rnorm, double* snorm, gsl_multilarge_linear_workspace* w);
int gsl_multilarge_linear_rcond (double* rcond, gsl_multilarge_linear_workspace* w);
int gsl_multilarge_linear_lcurve (gsl_vector* reg_param, gsl_vector* rho, gsl_vector* eta, gsl_multilarge_linear_workspace* w);
int gsl_multilarge_linear_wstdform1 (const(gsl_vector)* L, const(gsl_matrix)* X, const(gsl_vector)* w, const(gsl_vector)* y, gsl_matrix* Xs, gsl_vector* ys, gsl_multilarge_linear_workspace* work);
int gsl_multilarge_linear_stdform1 (const(gsl_vector)* L, const(gsl_matrix)* X, const(gsl_vector)* y, gsl_matrix* Xs, gsl_vector* ys, gsl_multilarge_linear_workspace* work);
int gsl_multilarge_linear_L_decomp (gsl_matrix* L, gsl_vector* tau);
int gsl_multilarge_linear_wstdform2 (const(gsl_matrix)* LQR, const(gsl_vector)* Ltau, const(gsl_matrix)* X, const(gsl_vector)* w, const(gsl_vector)* y, gsl_matrix* Xs, gsl_vector* ys, gsl_multilarge_linear_workspace* work);
int gsl_multilarge_linear_stdform2 (const(gsl_matrix)* LQR, const(gsl_vector)* Ltau, const(gsl_matrix)* X, const(gsl_vector)* y, gsl_matrix* Xs, gsl_vector* ys, gsl_multilarge_linear_workspace* work);
int gsl_multilarge_linear_genform1 (const(gsl_vector)* L, const(gsl_vector)* cs, gsl_vector* c, gsl_multilarge_linear_workspace* work);
int gsl_multilarge_linear_genform2 (const(gsl_matrix)* LQR, const(gsl_vector)* Ltau, const(gsl_vector)* cs, gsl_vector* c, gsl_multilarge_linear_workspace* work);