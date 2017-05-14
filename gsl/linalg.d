/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.linalg;
//import core.stdc.complex;
import gsl.mode;
import gsl.permutation;
import gsl.vector;
import gsl.matrix;
import gsl.math;
import gsl.complex;

extern (C):

enum gsl_linalg_matrix_mod_t
{
    GSL_LINALG_MOD_NONE = 0,
    GSL_LINALG_MOD_TRANSPOSE = 1,
    GSL_LINALG_MOD_CONJUGATE = 2
}

int gsl_linalg_matmult (const(gsl_matrix)* A, const(gsl_matrix)* B, gsl_matrix* C);
int gsl_linalg_matmult_mod (const(gsl_matrix)* A, gsl_linalg_matrix_mod_t modA, const(gsl_matrix)* B, gsl_linalg_matrix_mod_t modB, gsl_matrix* C);
int gsl_linalg_exponential_ss (const(gsl_matrix)* A, gsl_matrix* eA, gsl_mode_t mode);
double gsl_linalg_householder_transform (gsl_vector* v);
gsl_complex gsl_linalg_complex_householder_transform (gsl_vector_complex* v);
int gsl_linalg_householder_hm (double tau, const(gsl_vector)* v, gsl_matrix* A);
int gsl_linalg_householder_mh (double tau, const(gsl_vector)* v, gsl_matrix* A);
int gsl_linalg_householder_hv (double tau, const(gsl_vector)* v, gsl_vector* w);
int gsl_linalg_householder_hm1 (double tau, gsl_matrix* A);
int gsl_linalg_complex_householder_hm (gsl_complex tau, const(gsl_vector_complex)* v, gsl_matrix_complex* A);
int gsl_linalg_complex_householder_mh (gsl_complex tau, const(gsl_vector_complex)* v, gsl_matrix_complex* A);
int gsl_linalg_complex_householder_hv (gsl_complex tau, const(gsl_vector_complex)* v, gsl_vector_complex* w);
int gsl_linalg_hessenberg_decomp (gsl_matrix* A, gsl_vector* tau);
int gsl_linalg_hessenberg_unpack (gsl_matrix* H, gsl_vector* tau, gsl_matrix* U);
int gsl_linalg_hessenberg_unpack_accum (gsl_matrix* H, gsl_vector* tau, gsl_matrix* U);
int gsl_linalg_hessenberg_set_zero (gsl_matrix* H);
int gsl_linalg_hessenberg_submatrix (gsl_matrix* M, gsl_matrix* A, size_t top, gsl_vector* tau);
int gsl_linalg_hessenberg (gsl_matrix* A, gsl_vector* tau);
int gsl_linalg_hesstri_decomp (gsl_matrix* A, gsl_matrix* B, gsl_matrix* U, gsl_matrix* V, gsl_vector* work);
int gsl_linalg_SV_decomp (gsl_matrix* A, gsl_matrix* V, gsl_vector* S, gsl_vector* work);
int gsl_linalg_SV_decomp_mod (gsl_matrix* A, gsl_matrix* X, gsl_matrix* V, gsl_vector* S, gsl_vector* work);
int gsl_linalg_SV_decomp_jacobi (gsl_matrix* A, gsl_matrix* Q, gsl_vector* S);
int gsl_linalg_SV_solve (const(gsl_matrix)* U, const(gsl_matrix)* Q, const(gsl_vector)* S, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_SV_leverage (const(gsl_matrix)* U, gsl_vector* h);
int gsl_linalg_LU_decomp (gsl_matrix* A, gsl_permutation* p, int* signum);
int gsl_linalg_LU_solve (const(gsl_matrix)* LU, const(gsl_permutation)* p, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_LU_svx (const(gsl_matrix)* LU, const(gsl_permutation)* p, gsl_vector* x);
int gsl_linalg_LU_refine (const(gsl_matrix)* A, const(gsl_matrix)* LU, const(gsl_permutation)* p, const(gsl_vector)* b, gsl_vector* x, gsl_vector* residual);
int gsl_linalg_LU_invert (const(gsl_matrix)* LU, const(gsl_permutation)* p, gsl_matrix* inverse);
double gsl_linalg_LU_det (gsl_matrix* LU, int signum);
double gsl_linalg_LU_lndet (gsl_matrix* LU);
int gsl_linalg_LU_sgndet (gsl_matrix* lu, int signum);
int gsl_linalg_complex_LU_decomp (gsl_matrix_complex* A, gsl_permutation* p, int* signum);
int gsl_linalg_complex_LU_solve (const(gsl_matrix_complex)* LU, const(gsl_permutation)* p, const(gsl_vector_complex)* b, gsl_vector_complex* x);
int gsl_linalg_complex_LU_svx (const(gsl_matrix_complex)* LU, const(gsl_permutation)* p, gsl_vector_complex* x);
int gsl_linalg_complex_LU_refine (const(gsl_matrix_complex)* A, const(gsl_matrix_complex)* LU, const(gsl_permutation)* p, const(gsl_vector_complex)* b, gsl_vector_complex* x, gsl_vector_complex* residual);
int gsl_linalg_complex_LU_invert (const(gsl_matrix_complex)* LU, const(gsl_permutation)* p, gsl_matrix_complex* inverse);
gsl_complex gsl_linalg_complex_LU_det (gsl_matrix_complex* LU, int signum);
double gsl_linalg_complex_LU_lndet (gsl_matrix_complex* LU);
gsl_complex gsl_linalg_complex_LU_sgndet (gsl_matrix_complex* LU, int signum);
int gsl_linalg_QR_decomp (gsl_matrix* A, gsl_vector* tau);
int gsl_linalg_QR_solve (const(gsl_matrix)* QR, const(gsl_vector)* tau, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_QR_svx (const(gsl_matrix)* QR, const(gsl_vector)* tau, gsl_vector* x);
int gsl_linalg_QR_lssolve (const(gsl_matrix)* QR, const(gsl_vector)* tau, const(gsl_vector)* b, gsl_vector* x, gsl_vector* residual);
int gsl_linalg_QR_QRsolve (gsl_matrix* Q, gsl_matrix* R, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_QR_Rsolve (const(gsl_matrix)* QR, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_QR_Rsvx (const(gsl_matrix)* QR, gsl_vector* x);
int gsl_linalg_QR_update (gsl_matrix* Q, gsl_matrix* R, gsl_vector* w, const(gsl_vector)* v);
int gsl_linalg_QR_QTvec (const(gsl_matrix)* QR, const(gsl_vector)* tau, gsl_vector* v);
int gsl_linalg_QR_Qvec (const(gsl_matrix)* QR, const(gsl_vector)* tau, gsl_vector* v);
int gsl_linalg_QR_QTmat (const(gsl_matrix)* QR, const(gsl_vector)* tau, gsl_matrix* A);
int gsl_linalg_QR_matQ (const(gsl_matrix)* QR, const(gsl_vector)* tau, gsl_matrix* A);
int gsl_linalg_QR_unpack (const(gsl_matrix)* QR, const(gsl_vector)* tau, gsl_matrix* Q, gsl_matrix* R);
int gsl_linalg_R_solve (const(gsl_matrix)* R, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_R_svx (const(gsl_matrix)* R, gsl_vector* x);
int gsl_linalg_QRPT_decomp (gsl_matrix* A, gsl_vector* tau, gsl_permutation* p, int* signum, gsl_vector* norm);
int gsl_linalg_QRPT_decomp2 (const(gsl_matrix)* A, gsl_matrix* q, gsl_matrix* r, gsl_vector* tau, gsl_permutation* p, int* signum, gsl_vector* norm);
int gsl_linalg_QRPT_solve (const(gsl_matrix)* QR, const(gsl_vector)* tau, const(gsl_permutation)* p, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_QRPT_svx (const(gsl_matrix)* QR, const(gsl_vector)* tau, const(gsl_permutation)* p, gsl_vector* x);
int gsl_linalg_QRPT_QRsolve (const(gsl_matrix)* Q, const(gsl_matrix)* R, const(gsl_permutation)* p, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_QRPT_Rsolve (const(gsl_matrix)* QR, const(gsl_permutation)* p, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_QRPT_Rsvx (const(gsl_matrix)* QR, const(gsl_permutation)* p, gsl_vector* x);
int gsl_linalg_QRPT_update (gsl_matrix* Q, gsl_matrix* R, const(gsl_permutation)* p, gsl_vector* u, const(gsl_vector)* v);
int gsl_linalg_LQ_decomp (gsl_matrix* A, gsl_vector* tau);
int gsl_linalg_LQ_solve_T (const(gsl_matrix)* LQ, const(gsl_vector)* tau, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_LQ_svx_T (const(gsl_matrix)* LQ, const(gsl_vector)* tau, gsl_vector* x);
int gsl_linalg_LQ_lssolve_T (const(gsl_matrix)* LQ, const(gsl_vector)* tau, const(gsl_vector)* b, gsl_vector* x, gsl_vector* residual);
int gsl_linalg_LQ_Lsolve_T (const(gsl_matrix)* LQ, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_LQ_Lsvx_T (const(gsl_matrix)* LQ, gsl_vector* x);
int gsl_linalg_L_solve_T (const(gsl_matrix)* L, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_LQ_vecQ (const(gsl_matrix)* LQ, const(gsl_vector)* tau, gsl_vector* v);
int gsl_linalg_LQ_vecQT (const(gsl_matrix)* LQ, const(gsl_vector)* tau, gsl_vector* v);
int gsl_linalg_LQ_unpack (const(gsl_matrix)* LQ, const(gsl_vector)* tau, gsl_matrix* Q, gsl_matrix* L);
int gsl_linalg_LQ_update (gsl_matrix* Q, gsl_matrix* R, const(gsl_vector)* v, gsl_vector* w);
int gsl_linalg_LQ_LQsolve (gsl_matrix* Q, gsl_matrix* L, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_PTLQ_decomp (gsl_matrix* A, gsl_vector* tau, gsl_permutation* p, int* signum, gsl_vector* norm);
int gsl_linalg_PTLQ_decomp2 (const(gsl_matrix)* A, gsl_matrix* q, gsl_matrix* r, gsl_vector* tau, gsl_permutation* p, int* signum, gsl_vector* norm);
int gsl_linalg_PTLQ_solve_T (const(gsl_matrix)* QR, const(gsl_vector)* tau, const(gsl_permutation)* p, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_PTLQ_svx_T (const(gsl_matrix)* LQ, const(gsl_vector)* tau, const(gsl_permutation)* p, gsl_vector* x);
int gsl_linalg_PTLQ_LQsolve_T (const(gsl_matrix)* Q, const(gsl_matrix)* L, const(gsl_permutation)* p, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_PTLQ_Lsolve_T (const(gsl_matrix)* LQ, const(gsl_permutation)* p, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_PTLQ_Lsvx_T (const(gsl_matrix)* LQ, const(gsl_permutation)* p, gsl_vector* x);
int gsl_linalg_PTLQ_update (gsl_matrix* Q, gsl_matrix* L, const(gsl_permutation)* p, const(gsl_vector)* v, gsl_vector* w);
int gsl_linalg_cholesky_decomp (gsl_matrix* A);
int gsl_linalg_cholesky_solve (const(gsl_matrix)* cholesky, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_cholesky_svx (const(gsl_matrix)* cholesky, gsl_vector* x);
int gsl_linalg_cholesky_invert (gsl_matrix* cholesky);
int gsl_linalg_cholesky_decomp_unit (gsl_matrix* A, gsl_vector* D);
int gsl_linalg_complex_cholesky_decomp (gsl_matrix_complex* A);
int gsl_linalg_complex_cholesky_solve (const(gsl_matrix_complex)* cholesky, const(gsl_vector_complex)* b, gsl_vector_complex* x);
int gsl_linalg_complex_cholesky_svx (const(gsl_matrix_complex)* cholesky, gsl_vector_complex* x);
int gsl_linalg_complex_cholesky_invert (gsl_matrix_complex* cholesky);
int gsl_linalg_symmtd_decomp (gsl_matrix* A, gsl_vector* tau);
int gsl_linalg_symmtd_unpack (const(gsl_matrix)* A, const(gsl_vector)* tau, gsl_matrix* Q, gsl_vector* diag, gsl_vector* subdiag);
int gsl_linalg_symmtd_unpack_T (const(gsl_matrix)* A, gsl_vector* diag, gsl_vector* subdiag);
int gsl_linalg_hermtd_decomp (gsl_matrix_complex* A, gsl_vector_complex* tau);
int gsl_linalg_hermtd_unpack (const(gsl_matrix_complex)* A, const(gsl_vector_complex)* tau, gsl_matrix_complex* U, gsl_vector* diag, gsl_vector* sudiag);
int gsl_linalg_hermtd_unpack_T (const(gsl_matrix_complex)* A, gsl_vector* diag, gsl_vector* subdiag);
int gsl_linalg_HH_solve (gsl_matrix* A, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_HH_svx (gsl_matrix* A, gsl_vector* x);
int gsl_linalg_solve_symm_tridiag (const(gsl_vector)* diag, const(gsl_vector)* offdiag, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_solve_tridiag (const(gsl_vector)* diag, const(gsl_vector)* abovediag, const(gsl_vector)* belowdiag, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_solve_symm_cyc_tridiag (const(gsl_vector)* diag, const(gsl_vector)* offdiag, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_solve_cyc_tridiag (const(gsl_vector)* diag, const(gsl_vector)* abovediag, const(gsl_vector)* belowdiag, const(gsl_vector)* b, gsl_vector* x);
int gsl_linalg_bidiag_decomp (gsl_matrix* A, gsl_vector* tau_U, gsl_vector* tau_V);
int gsl_linalg_bidiag_unpack (const(gsl_matrix)* A, const(gsl_vector)* tau_U, gsl_matrix* U, const(gsl_vector)* tau_V, gsl_matrix* V, gsl_vector* diag, gsl_vector* superdiag);
int gsl_linalg_bidiag_unpack2 (gsl_matrix* A, gsl_vector* tau_U, gsl_vector* tau_V, gsl_matrix* V);
int gsl_linalg_bidiag_unpack_B (const(gsl_matrix)* A, gsl_vector* diag, gsl_vector* superdiag);
int gsl_linalg_balance_matrix (gsl_matrix* A, gsl_vector* D);
int gsl_linalg_balance_accum (gsl_matrix* A, gsl_vector* D);
int gsl_linalg_balance_columns (gsl_matrix* A, gsl_vector* D);
void gsl_linalg_givens (const double a, const double b, double* c, double* s);
void gsl_linalg_givens_gv (gsl_vector* v, const size_t i, const size_t j, const double c, const double s);