/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.multifit;
import gsl.math;
import gsl.vector;
import gsl.matrix;
import gsl.permutation;

extern (C):

//gsl_multifit
extern __gshared const(gsl_multifit_robust_type)* gsl_multifit_robust_default;
extern __gshared const(gsl_multifit_robust_type)* gsl_multifit_robust_bisquare;
extern __gshared const(gsl_multifit_robust_type)* gsl_multifit_robust_cauchy;
extern __gshared const(gsl_multifit_robust_type)* gsl_multifit_robust_fair;
extern __gshared const(gsl_multifit_robust_type)* gsl_multifit_robust_huber;
extern __gshared const(gsl_multifit_robust_type)* gsl_multifit_robust_ols;
extern __gshared const(gsl_multifit_robust_type)* gsl_multifit_robust_welsch;

struct gsl_multifit_linear_workspace
{
    size_t nmax;
    size_t pmax;
    size_t n;
    size_t p;
    gsl_matrix* A;
    gsl_matrix* Q;
    gsl_matrix* QSI;
    gsl_vector* S;
    gsl_vector* t;
    gsl_vector* xt;
    gsl_vector* D;
    double rcond;
}

struct gsl_multifit_robust_type
{
    const(char)* name;
    int function (const(gsl_vector)*, gsl_vector*) wfun;
    int function (const(gsl_vector)*, gsl_vector*) psi_deriv;
    double tuning_default;
}

struct gsl_multifit_robust_stats
{
    double sigma_ols;
    double sigma_mad;
    double sigma_rob;
    double sigma;
    double Rsq;
    double adj_Rsq;
    double rmse;
    double sse;
    size_t dof;
    size_t numit;
    gsl_vector* weights;
    gsl_vector* r;
}

struct gsl_multifit_robust_workspace
{
    size_t n;
    size_t p;
    size_t numit;
    size_t maxiter;
    const(gsl_multifit_robust_type)* type;
    double tune;
    gsl_vector* r;
    gsl_vector* weights;
    gsl_vector* c_prev;
    gsl_vector* resfac;
    gsl_vector* psi;
    gsl_vector* dpsi;
    gsl_matrix* QSI;
    gsl_vector* D;
    gsl_vector* workn;
    gsl_multifit_robust_stats stats;
    gsl_multifit_linear_workspace* multifit_p;
}

gsl_multifit_linear_workspace* gsl_multifit_linear_alloc (const size_t n, const size_t p);
void gsl_multifit_linear_free (gsl_multifit_linear_workspace* w);
int gsl_multifit_linear (const(gsl_matrix)* X, const(gsl_vector)* y, gsl_vector* c, gsl_matrix* cov, double* chisq, gsl_multifit_linear_workspace* work);
int gsl_multifit_linear_svd (const(gsl_matrix)* X, gsl_multifit_linear_workspace* work);
int gsl_multifit_linear_bsvd (const(gsl_matrix)* X, gsl_multifit_linear_workspace* work);
int gsl_multifit_linear_solve (const double lambda, const(gsl_matrix)* X, const(gsl_vector)* y, gsl_vector* c, double* rnorm, double* snorm, gsl_multifit_linear_workspace* work);
int gsl_multifit_linear_applyW (const(gsl_matrix)* X, const(gsl_vector)* w, const(gsl_vector)* y, gsl_matrix* WX, gsl_vector* Wy);
int gsl_multifit_linear_stdform1 (const(gsl_vector)* L, const(gsl_matrix)* X, const(gsl_vector)* y, gsl_matrix* Xs, gsl_vector* ys, gsl_multifit_linear_workspace* work);
int gsl_multifit_linear_wstdform1 (const(gsl_vector)* L, const(gsl_matrix)* X, const(gsl_vector)* w, const(gsl_vector)* y, gsl_matrix* Xs, gsl_vector* ys, gsl_multifit_linear_workspace* work);
int gsl_multifit_linear_L_decomp (gsl_matrix* L, gsl_vector* tau);
int gsl_multifit_linear_stdform2 (const(gsl_matrix)* LQR, const(gsl_vector)* Ltau, const(gsl_matrix)* X, const(gsl_vector)* y, gsl_matrix* Xs, gsl_vector* ys, gsl_matrix* M, gsl_multifit_linear_workspace* work);
int gsl_multifit_linear_wstdform2 (const(gsl_matrix)* LQR, const(gsl_vector)* Ltau, const(gsl_matrix)* X, const(gsl_vector)* w, const(gsl_vector)* y, gsl_matrix* Xs, gsl_vector* ys, gsl_matrix* M, gsl_multifit_linear_workspace* work);
int gsl_multifit_linear_genform1 (const(gsl_vector)* L, const(gsl_vector)* cs, gsl_vector* c, gsl_multifit_linear_workspace* work);
int gsl_multifit_linear_genform2 (const(gsl_matrix)* LQR, const(gsl_vector)* Ltau, const(gsl_matrix)* X, const(gsl_vector)* y, const(gsl_vector)* cs, const(gsl_matrix)* M, gsl_vector* c, gsl_multifit_linear_workspace* work);
int gsl_multifit_linear_wgenform2 (const(gsl_matrix)* LQR, const(gsl_vector)* Ltau, const(gsl_matrix)* X, const(gsl_vector)* w, const(gsl_vector)* y, const(gsl_vector)* cs, const(gsl_matrix)* M, gsl_vector* c, gsl_multifit_linear_workspace* work);
int gsl_multifit_linear_lreg (const double smin, const double smax, gsl_vector* reg_param);
int gsl_multifit_linear_lcurve (const(gsl_vector)* y, gsl_vector* reg_param, gsl_vector* rho, gsl_vector* eta, gsl_multifit_linear_workspace* work);
int gsl_multifit_linear_lcorner (const(gsl_vector)* rho, const(gsl_vector)* eta, size_t* idx);
int gsl_multifit_linear_lcorner2 (const(gsl_vector)* reg_param, const(gsl_vector)* eta, size_t* idx);
int gsl_multifit_linear_Lk (const size_t p, const size_t k, gsl_matrix* L);
int gsl_multifit_linear_Lsobolev (const size_t p, const size_t kmax, const(gsl_vector)* alpha, gsl_matrix* L, gsl_multifit_linear_workspace* work);
int gsl_multifit_wlinear (const(gsl_matrix)* X, const(gsl_vector)* w, const(gsl_vector)* y, gsl_vector* c, gsl_matrix* cov, double* chisq, gsl_multifit_linear_workspace* work);
int gsl_multifit_wlinear_svd (const(gsl_matrix)* X, const(gsl_vector)* w, const(gsl_vector)* y, double tol, size_t* rank, gsl_vector* c, gsl_matrix* cov, double* chisq, gsl_multifit_linear_workspace* work);
int gsl_multifit_wlinear_usvd (const(gsl_matrix)* X, const(gsl_vector)* w, const(gsl_vector)* y, double tol, size_t* rank, gsl_vector* c, gsl_matrix* cov, double* chisq, gsl_multifit_linear_workspace* work);
int gsl_multifit_linear_est (const(gsl_vector)* x, const(gsl_vector)* c, const(gsl_matrix)* cov, double* y, double* y_err);
double gsl_multifit_linear_rcond (const(gsl_multifit_linear_workspace)* w);
int gsl_multifit_linear_residuals (const(gsl_matrix)* X, const(gsl_vector)* y, const(gsl_vector)* c, gsl_vector* r);
gsl_multifit_robust_workspace* gsl_multifit_robust_alloc (const(gsl_multifit_robust_type)* T, const size_t n, const size_t p);
void gsl_multifit_robust_free (gsl_multifit_robust_workspace* w);
int gsl_multifit_robust_tune (const double tune, gsl_multifit_robust_workspace* w);
int gsl_multifit_robust_maxiter (const size_t maxiter, gsl_multifit_robust_workspace* w);
const(char)* gsl_multifit_robust_name (const(gsl_multifit_robust_workspace)* w);
gsl_multifit_robust_stats gsl_multifit_robust_statistics (const(gsl_multifit_robust_workspace)* w);
int gsl_multifit_robust_weights (const(gsl_vector)* r, gsl_vector* wts, gsl_multifit_robust_workspace* w);
int gsl_multifit_robust (const(gsl_matrix)* X, const(gsl_vector)* y, gsl_vector* c, gsl_matrix* cov, gsl_multifit_robust_workspace* w);
int gsl_multifit_robust_est (const(gsl_vector)* x, const(gsl_vector)* c, const(gsl_matrix)* cov, double* y, double* y_err);
int gsl_multifit_robust_residuals (const(gsl_matrix)* X, const(gsl_vector)* y, const(gsl_vector)* c, gsl_vector* r, gsl_multifit_robust_workspace* w);

//gsl_multifit_nlin
alias gsl_multifit_function_struct gsl_multifit_function;
alias gsl_multifit_function_fdf_struct gsl_multifit_function_fdf;

extern __gshared const(gsl_multifit_fdfsolver_type)* gsl_multifit_fdfsolver_lmsder;
extern __gshared const(gsl_multifit_fdfsolver_type)* gsl_multifit_fdfsolver_lmder;
extern __gshared const(gsl_multifit_fdfsolver_type)* gsl_multifit_fdfsolver_lmniel;

struct gsl_multifit_function_struct
{
    int function (const(gsl_vector)*, void*, gsl_vector*) f;
    size_t n;
    size_t p;
    void* params;
}

struct gsl_multifit_fsolver_type
{
    const(char)* name;
    size_t size;
    int function (void*, size_t, size_t) alloc;
    int function (void*, gsl_multifit_function*, gsl_vector*, gsl_vector*, gsl_vector*) set;
    int function (void*, gsl_multifit_function*, gsl_vector*, gsl_vector*, gsl_vector*) iterate;
    void function (void*) free;
}

struct gsl_multifit_fsolver
{
    const(gsl_multifit_fsolver_type)* type;
    gsl_multifit_function* function_;
    gsl_vector* x;
    gsl_vector* f;
    gsl_vector* dx;
    void* state;
}

struct gsl_multifit_function_fdf_struct
{
    int function (const(gsl_vector)*, void*, gsl_vector*) f;
    int function (const(gsl_vector)*, void*, gsl_matrix*) df;
    int function (const(gsl_vector)*, void*, gsl_vector*, gsl_matrix*) fdf;
    size_t n;
    size_t p;
    void* params;
    size_t nevalf;
    size_t nevaldf;
}

struct gsl_multifit_fdfsolver_type
{
    const(char)* name;
    size_t size;
    int function (void*, size_t, size_t) alloc;
    int function (void*, const(gsl_vector)*, gsl_multifit_function_fdf*, gsl_vector*, gsl_vector*, gsl_vector*) set;
    int function (void*, const(gsl_vector)*, gsl_multifit_function_fdf*, gsl_vector*, gsl_vector*, gsl_vector*) iterate;
    int function (void*, gsl_vector*) gradient;
    int function (void*, gsl_matrix*) jac;
    void function (void*) free;
}

struct gsl_multifit_fdfsolver
{
    const(gsl_multifit_fdfsolver_type)* type;
    gsl_multifit_function_fdf* fdf;
    gsl_vector* x;
    gsl_vector* f;
    gsl_vector* dx;
    gsl_vector* g;
    gsl_vector* sqrt_wts;
    size_t niter;
    void* state;
}

struct gsl_multifit_fdfridge
{
    size_t n;
    size_t p;
    double lambda;
    const(gsl_vector)* L_diag;
    const(gsl_matrix)* L;
    gsl_vector* f;
    gsl_vector* wts;
    gsl_multifit_fdfsolver* s;
    gsl_multifit_function_fdf* fdf;
    gsl_multifit_function_fdf fdftik;
}

int gsl_multifit_gradient (const(gsl_matrix)* J, const(gsl_vector)* f, gsl_vector* g);
int gsl_multifit_covar (const(gsl_matrix)* J, const double epsrel, gsl_matrix* covar);
int gsl_multifit_covar_QRPT (gsl_matrix* r, gsl_permutation* perm, const double epsrel, gsl_matrix* covar);
gsl_multifit_fsolver* gsl_multifit_fsolver_alloc (const(gsl_multifit_fsolver_type)* T, size_t n, size_t p);
void gsl_multifit_fsolver_free (gsl_multifit_fsolver* s);
int gsl_multifit_fsolver_set (gsl_multifit_fsolver* s, gsl_multifit_function* f, const(gsl_vector)* x);
int gsl_multifit_fsolver_iterate (gsl_multifit_fsolver* s);
int gsl_multifit_fsolver_driver (gsl_multifit_fsolver* s, const size_t maxiter, const double epsabs, const double epsrel);
const(char)* gsl_multifit_fsolver_name (const(gsl_multifit_fsolver)* s);
gsl_vector* gsl_multifit_fsolver_position (const(gsl_multifit_fsolver)* s);
gsl_multifit_fdfsolver* gsl_multifit_fdfsolver_alloc (const(gsl_multifit_fdfsolver_type)* T, size_t n, size_t p);
int gsl_multifit_fdfsolver_set (gsl_multifit_fdfsolver* s, gsl_multifit_function_fdf* fdf, const(gsl_vector)* x);
int gsl_multifit_fdfsolver_wset (gsl_multifit_fdfsolver* s, gsl_multifit_function_fdf* f, const(gsl_vector)* x, const(gsl_vector)* wts);
int gsl_multifit_fdfsolver_iterate (gsl_multifit_fdfsolver* s);
int gsl_multifit_fdfsolver_driver (gsl_multifit_fdfsolver* s, const size_t maxiter, const double xtol, const double gtol, const double ftol, int* info);
int gsl_multifit_fdfsolver_jac (gsl_multifit_fdfsolver* s, gsl_matrix* J);
void gsl_multifit_fdfsolver_free (gsl_multifit_fdfsolver* s);
const(char)* gsl_multifit_fdfsolver_name (const(gsl_multifit_fdfsolver)* s);
gsl_vector* gsl_multifit_fdfsolver_position (const(gsl_multifit_fdfsolver)* s);
gsl_vector* gsl_multifit_fdfsolver_residual (const(gsl_multifit_fdfsolver)* s);
size_t gsl_multifit_fdfsolver_niter (const(gsl_multifit_fdfsolver)* s);
int gsl_multifit_eval_wf (gsl_multifit_function_fdf* fdf, const(gsl_vector)* x, const(gsl_vector)* wts, gsl_vector* y);
int gsl_multifit_eval_wdf (gsl_multifit_function_fdf* fdf, const(gsl_vector)* x, const(gsl_vector)* wts, gsl_matrix* dy);
int gsl_multifit_fdfsolver_test (const(gsl_multifit_fdfsolver)* s, const double xtol, const double gtol, const double ftol, int* info);
int gsl_multifit_test_delta (const(gsl_vector)* dx, const(gsl_vector)* x, double epsabs, double epsrel);
int gsl_multifit_test_gradient (const(gsl_vector)* g, double epsabs);
int gsl_multifit_fdfsolver_dif_df (const(gsl_vector)* x, const(gsl_vector)* wts, gsl_multifit_function_fdf* fdf, const(gsl_vector)* f, gsl_matrix* J);
int gsl_multifit_fdfsolver_dif_fdf (const(gsl_vector)* x, gsl_multifit_function_fdf* fdf, gsl_vector* f, gsl_matrix* J);
gsl_multifit_fdfridge* gsl_multifit_fdfridge_alloc (const(gsl_multifit_fdfsolver_type)* T, const size_t n, const size_t p);
void gsl_multifit_fdfridge_free (gsl_multifit_fdfridge* work);
const(char)* gsl_multifit_fdfridge_name (const(gsl_multifit_fdfridge)* w);
gsl_vector* gsl_multifit_fdfridge_position (const(gsl_multifit_fdfridge)* w);
gsl_vector* gsl_multifit_fdfridge_residual (const(gsl_multifit_fdfridge)* w);
size_t gsl_multifit_fdfridge_niter (const(gsl_multifit_fdfridge)* w);
int gsl_multifit_fdfridge_set (gsl_multifit_fdfridge* w, gsl_multifit_function_fdf* f, const(gsl_vector)* x, const double lambda);
int gsl_multifit_fdfridge_wset (gsl_multifit_fdfridge* w, gsl_multifit_function_fdf* f, const(gsl_vector)* x, const double lambda, const(gsl_vector)* wts);
int gsl_multifit_fdfridge_set2 (gsl_multifit_fdfridge* w, gsl_multifit_function_fdf* f, const(gsl_vector)* x, const(gsl_vector)* lambda);
int gsl_multifit_fdfridge_wset2 (gsl_multifit_fdfridge* w, gsl_multifit_function_fdf* f, const(gsl_vector)* x, const(gsl_vector)* lambda, const(gsl_vector)* wts);
int gsl_multifit_fdfridge_set3 (gsl_multifit_fdfridge* w, gsl_multifit_function_fdf* f, const(gsl_vector)* x, const(gsl_matrix)* L);
int gsl_multifit_fdfridge_wset3 (gsl_multifit_fdfridge* w, gsl_multifit_function_fdf* f, const(gsl_vector)* x, const(gsl_matrix)* L, const(gsl_vector)* wts);
int gsl_multifit_fdfridge_iterate (gsl_multifit_fdfridge* w);
int gsl_multifit_fdfridge_driver (gsl_multifit_fdfridge* w, const size_t maxiter, const double xtol, const double gtol, const double ftol, int* info);