/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.eigen;
import gsl.vector;
import gsl.matrix;
import gsl.complex;

extern (C):

enum gsl_eigen_sort_t
{
    GSL_EIGEN_SORT_VAL_ASC = 0,
    GSL_EIGEN_SORT_VAL_DESC = 1,
    GSL_EIGEN_SORT_ABS_ASC = 2,
    GSL_EIGEN_SORT_ABS_DESC = 3
}

struct gsl_eigen_symm_workspace
{
    size_t size;
    double* d;
    double* sd;
}

struct gsl_eigen_symmv_workspace
{
    size_t size;
    double* d;
    double* sd;
    double* gc;
    double* gs;
}

struct gsl_eigen_herm_workspace
{
    size_t size;
    double* d;
    double* sd;
    double* tau;
}

struct gsl_eigen_hermv_workspace
{
    size_t size;
    double* d;
    double* sd;
    double* tau;
    double* gc;
    double* gs;
}

struct gsl_eigen_francis_workspace
{
    size_t size;
    size_t max_iterations;
    size_t n_iter;
    size_t n_evals;
    int compute_t;
    gsl_matrix* H;
    gsl_matrix* Z;
}

struct gsl_eigen_nonsymm_workspace
{
    size_t size;
    gsl_vector* diag;
    gsl_vector* tau;
    gsl_matrix* Z;
    int do_balance;
    size_t n_evals;
    gsl_eigen_francis_workspace* francis_workspace_p;
}

struct gsl_eigen_nonsymmv_workspace
{
    size_t size;
    gsl_vector* work;
    gsl_vector* work2;
    gsl_vector* work3;
    gsl_matrix* Z;
    gsl_eigen_nonsymm_workspace* nonsymm_workspace_p;
}

struct gsl_eigen_gensymm_workspace
{
    size_t size;
    gsl_eigen_symm_workspace* symm_workspace_p;
}

struct gsl_eigen_gensymmv_workspace
{
    size_t size;
    gsl_eigen_symmv_workspace* symmv_workspace_p;
}

struct gsl_eigen_genherm_workspace
{
    size_t size;
    gsl_eigen_herm_workspace* herm_workspace_p;
}

struct gsl_eigen_genhermv_workspace
{
    size_t size;
    gsl_eigen_hermv_workspace* hermv_workspace_p;
}

struct gsl_eigen_gen_workspace
{
    size_t size;
    gsl_vector* work;
    size_t n_evals;
    size_t max_iterations;
    size_t n_iter;
    double eshift;
    int needtop;
    double atol;
    double btol;
    double ascale;
    double bscale;
    gsl_matrix* H;
    gsl_matrix* R;
    int compute_s;
    int compute_t;
    gsl_matrix* Q;
    gsl_matrix* Z;
}

struct gsl_eigen_genv_workspace
{
    size_t size;
    gsl_vector* work1;
    gsl_vector* work2;
    gsl_vector* work3;
    gsl_vector* work4;
    gsl_vector* work5;
    gsl_vector* work6;
    gsl_matrix* Q;
    gsl_matrix* Z;
    gsl_eigen_gen_workspace* gen_workspace_p;
}

gsl_eigen_symm_workspace* gsl_eigen_symm_alloc (const size_t n);
void gsl_eigen_symm_free (gsl_eigen_symm_workspace* w);
int gsl_eigen_symm (gsl_matrix* A, gsl_vector* eval, gsl_eigen_symm_workspace* w);
gsl_eigen_symmv_workspace* gsl_eigen_symmv_alloc (const size_t n);
void gsl_eigen_symmv_free (gsl_eigen_symmv_workspace* w);
int gsl_eigen_symmv (gsl_matrix* A, gsl_vector* eval, gsl_matrix* evec, gsl_eigen_symmv_workspace* w);
gsl_eigen_herm_workspace* gsl_eigen_herm_alloc (const size_t n);
void gsl_eigen_herm_free (gsl_eigen_herm_workspace* w);
int gsl_eigen_herm (gsl_matrix_complex* A, gsl_vector* eval, gsl_eigen_herm_workspace* w);
gsl_eigen_hermv_workspace* gsl_eigen_hermv_alloc (const size_t n);
void gsl_eigen_hermv_free (gsl_eigen_hermv_workspace* w);
int gsl_eigen_hermv (gsl_matrix_complex* A, gsl_vector* eval, gsl_matrix_complex* evec, gsl_eigen_hermv_workspace* w);
gsl_eigen_francis_workspace* gsl_eigen_francis_alloc ();
void gsl_eigen_francis_free (gsl_eigen_francis_workspace* w);
void gsl_eigen_francis_T (const int compute_t, gsl_eigen_francis_workspace* w);
int gsl_eigen_francis (gsl_matrix* H, gsl_vector_complex* eval, gsl_eigen_francis_workspace* w);
int gsl_eigen_francis_Z (gsl_matrix* H, gsl_vector_complex* eval, gsl_matrix* Z, gsl_eigen_francis_workspace* w);
gsl_eigen_nonsymm_workspace* gsl_eigen_nonsymm_alloc (const size_t n);
void gsl_eigen_nonsymm_free (gsl_eigen_nonsymm_workspace* w);
void gsl_eigen_nonsymm_params (const int compute_t, const int balance, gsl_eigen_nonsymm_workspace* w);
int gsl_eigen_nonsymm (gsl_matrix* A, gsl_vector_complex* eval, gsl_eigen_nonsymm_workspace* w);
int gsl_eigen_nonsymm_Z (gsl_matrix* A, gsl_vector_complex* eval, gsl_matrix* Z, gsl_eigen_nonsymm_workspace* w);
gsl_eigen_nonsymmv_workspace* gsl_eigen_nonsymmv_alloc (const size_t n);
void gsl_eigen_nonsymmv_free (gsl_eigen_nonsymmv_workspace* w);
void gsl_eigen_nonsymmv_params (const int balance, gsl_eigen_nonsymmv_workspace* w);
int gsl_eigen_nonsymmv (gsl_matrix* A, gsl_vector_complex* eval, gsl_matrix_complex* evec, gsl_eigen_nonsymmv_workspace* w);
int gsl_eigen_nonsymmv_Z (gsl_matrix* A, gsl_vector_complex* eval, gsl_matrix_complex* evec, gsl_matrix* Z, gsl_eigen_nonsymmv_workspace* w);
gsl_eigen_gensymm_workspace* gsl_eigen_gensymm_alloc (const size_t n);
void gsl_eigen_gensymm_free (gsl_eigen_gensymm_workspace* w);
int gsl_eigen_gensymm (gsl_matrix* A, gsl_matrix* B, gsl_vector* eval, gsl_eigen_gensymm_workspace* w);
int gsl_eigen_gensymm_standardize (gsl_matrix* A, const(gsl_matrix)* B);
gsl_eigen_gensymmv_workspace* gsl_eigen_gensymmv_alloc (const size_t n);
void gsl_eigen_gensymmv_free (gsl_eigen_gensymmv_workspace* w);
int gsl_eigen_gensymmv (gsl_matrix* A, gsl_matrix* B, gsl_vector* eval, gsl_matrix* evec, gsl_eigen_gensymmv_workspace* w);
gsl_eigen_genherm_workspace* gsl_eigen_genherm_alloc (const size_t n);
void gsl_eigen_genherm_free (gsl_eigen_genherm_workspace* w);
int gsl_eigen_genherm (gsl_matrix_complex* A, gsl_matrix_complex* B, gsl_vector* eval, gsl_eigen_genherm_workspace* w);
int gsl_eigen_genherm_standardize (gsl_matrix_complex* A, const(gsl_matrix_complex)* B);
gsl_eigen_genhermv_workspace* gsl_eigen_genhermv_alloc (const size_t n);
void gsl_eigen_genhermv_free (gsl_eigen_genhermv_workspace* w);
int gsl_eigen_genhermv (gsl_matrix_complex* A, gsl_matrix_complex* B, gsl_vector* eval, gsl_matrix_complex* evec, gsl_eigen_genhermv_workspace* w);
gsl_eigen_gen_workspace* gsl_eigen_gen_alloc (const size_t n);
void gsl_eigen_gen_free (gsl_eigen_gen_workspace* w);
void gsl_eigen_gen_params (const int compute_s, const int compute_t, const int balance, gsl_eigen_gen_workspace* w);
int gsl_eigen_gen (gsl_matrix* A, gsl_matrix* B, gsl_vector_complex* alpha, gsl_vector* beta, gsl_eigen_gen_workspace* w);
int gsl_eigen_gen_QZ (gsl_matrix* A, gsl_matrix* B, gsl_vector_complex* alpha, gsl_vector* beta, gsl_matrix* Q, gsl_matrix* Z, gsl_eigen_gen_workspace* w);
gsl_eigen_genv_workspace* gsl_eigen_genv_alloc (const size_t n);
void gsl_eigen_genv_free (gsl_eigen_genv_workspace* w);
int gsl_eigen_genv (gsl_matrix* A, gsl_matrix* B, gsl_vector_complex* alpha, gsl_vector* beta, gsl_matrix_complex* evec, gsl_eigen_genv_workspace* w);
int gsl_eigen_genv_QZ (gsl_matrix* A, gsl_matrix* B, gsl_vector_complex* alpha, gsl_vector* beta, gsl_matrix_complex* evec, gsl_matrix* Q, gsl_matrix* Z, gsl_eigen_genv_workspace* w);
int gsl_eigen_symmv_sort (gsl_vector* eval, gsl_matrix* evec, gsl_eigen_sort_t sort_type);
int gsl_eigen_hermv_sort (gsl_vector* eval, gsl_matrix_complex* evec, gsl_eigen_sort_t sort_type);
int gsl_eigen_nonsymmv_sort (gsl_vector_complex* eval, gsl_matrix_complex* evec, gsl_eigen_sort_t sort_type);
int gsl_eigen_gensymmv_sort (gsl_vector* eval, gsl_matrix* evec, gsl_eigen_sort_t sort_type);
int gsl_eigen_genhermv_sort (gsl_vector* eval, gsl_matrix_complex* evec, gsl_eigen_sort_t sort_type);
int gsl_eigen_genv_sort (gsl_vector_complex* alpha, gsl_vector* beta, gsl_matrix_complex* evec, gsl_eigen_sort_t sort_type);
int gsl_schur_gen_eigvals (const(gsl_matrix)* A, const(gsl_matrix)* B, double* wr1, double* wr2, double* wi, double* scale1, double* scale2);
int gsl_schur_solve_equation (double ca, const(gsl_matrix)* A, double z, double d1, double d2, const(gsl_vector)* b, gsl_vector* x, double* s, double* xnorm, double smin);
int gsl_schur_solve_equation_z (double ca, const(gsl_matrix)* A, gsl_complex* z, double d1, double d2, const(gsl_vector_complex)* b, gsl_vector_complex* x, double* s, double* xnorm, double smin);
int gsl_eigen_jacobi (gsl_matrix* matrix, gsl_vector* eval, gsl_matrix* evec, uint max_rot, uint* nrot);
int gsl_eigen_invert_jacobi (const(gsl_matrix)* matrix, gsl_matrix* ainv, uint max_rot);