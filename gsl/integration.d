/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.integration;
import gsl.math;

extern (C):

alias void function(const(gsl_function)* f, double a, double b, double* result, double* abserr, double* defabs, double* resabs) gsl_integration_rule;

enum gsl_integration_qawo_enum
{
    GSL_INTEG_COSINE = 0,
    GSL_INTEG_SINE = 1
}


enum GSL_INTEG_GAUSS15 = 1;
enum GSL_INTEG_GAUSS21 = 2;
enum GSL_INTEG_GAUSS31 = 3;
enum GSL_INTEG_GAUSS41 = 4;
enum GSL_INTEG_GAUSS51 = 5;
enum GSL_INTEG_GAUSS61 = 6;


struct gsl_integration_workspace
{
    size_t limit;
    size_t size;
    size_t nrmax;
    size_t i;
    size_t maximum_level;
    double* alist;
    double* blist;
    double* rlist;
    double* elist;
    size_t* order;
    size_t* level;
}

struct gsl_integration_qaws_table
{
    double alpha;
    double beta;
    int mu;
    int nu;
    double[25] ri;
    double[25] rj;
    double[25] rg;
    double[25] rh;
}

struct gsl_integration_qawo_table
{
    size_t n;
    double omega;
    double L;
    double par;
    enum gsl_integration_qawo_enum
    {
        GSL_INTEG_COSINE = 0,
        GSL_INTEG_SINE = 1
    }
    gsl_integration_qawo_enum sine;
    double* chebmo;
}

struct gsl_integration_glfixed_table
{
    size_t n;
    double* x;
    double* w;
    int precomputed;
}

struct gsl_integration_cquad_ival
{
    double a;
    double b;
    double[64] c;
    double[33] fx;
    double igral;
    double err;
    int depth;
    int rdepth;
    int ndiv;
}

struct gsl_integration_cquad_workspace
{
    size_t size;
    gsl_integration_cquad_ival* ivals;
    size_t* heap;
}

gsl_integration_workspace* gsl_integration_workspace_alloc (const size_t n);
void gsl_integration_workspace_free (gsl_integration_workspace* w);
gsl_integration_qaws_table* gsl_integration_qaws_table_alloc (double alpha, double beta, int mu, int nu);
int gsl_integration_qaws_table_set (gsl_integration_qaws_table* t, double alpha, double beta, int mu, int nu);
void gsl_integration_qaws_table_free (gsl_integration_qaws_table* t);
gsl_integration_qawo_table* gsl_integration_qawo_table_alloc (double omega, double L, gsl_integration_qawo_enum sine, size_t n);
int gsl_integration_qawo_table_set (gsl_integration_qawo_table* t, double omega, double L, gsl_integration_qawo_enum sine);
int gsl_integration_qawo_table_set_length (gsl_integration_qawo_table* t, double L);
void gsl_integration_qawo_table_free (gsl_integration_qawo_table* t);
void gsl_integration_qk15 (const(gsl_function)* f, double a, double b, double* result, double* abserr, double* resabs, double* resasc);
void gsl_integration_qk21 (const(gsl_function)* f, double a, double b, double* result, double* abserr, double* resabs, double* resasc);
void gsl_integration_qk31 (const(gsl_function)* f, double a, double b, double* result, double* abserr, double* resabs, double* resasc);
void gsl_integration_qk41 (const(gsl_function)* f, double a, double b, double* result, double* abserr, double* resabs, double* resasc);
void gsl_integration_qk51 (const(gsl_function)* f, double a, double b, double* result, double* abserr, double* resabs, double* resasc);
void gsl_integration_qk61 (const(gsl_function)* f, double a, double b, double* result, double* abserr, double* resabs, double* resasc);
void gsl_integration_qcheb (gsl_function* f, double a, double b, double* cheb12, double* cheb24);
void gsl_integration_qk (const int n, const(double)* xgk, const(double)* wg, const(double)* wgk, double* fv1, double* fv2, const(gsl_function)* f, double a, double b, double* result, double* abserr, double* resabs, double* resasc);
int gsl_integration_qng (const(gsl_function)* f, double a, double b, double epsabs, double epsrel, double* result, double* abserr, size_t* neval);
int gsl_integration_qag (const(gsl_function)* f, double a, double b, double epsabs, double epsrel, size_t limit, int key, gsl_integration_workspace* workspace, double* result, double* abserr);
int gsl_integration_qagi (gsl_function* f, double epsabs, double epsrel, size_t limit, gsl_integration_workspace* workspace, double* result, double* abserr);
int gsl_integration_qagiu (gsl_function* f, double a, double epsabs, double epsrel, size_t limit, gsl_integration_workspace* workspace, double* result, double* abserr);
int gsl_integration_qagil (gsl_function* f, double b, double epsabs, double epsrel, size_t limit, gsl_integration_workspace* workspace, double* result, double* abserr);
int gsl_integration_qags (const(gsl_function)* f, double a, double b, double epsabs, double epsrel, size_t limit, gsl_integration_workspace* workspace, double* result, double* abserr);
int gsl_integration_qagp (const(gsl_function)* f, double* pts, size_t npts, double epsabs, double epsrel, size_t limit, gsl_integration_workspace* workspace, double* result, double* abserr);
int gsl_integration_qawc (gsl_function* f, const double a, const double b, const double c, const double epsabs, const double epsrel, const size_t limit, gsl_integration_workspace* workspace, double* result, double* abserr);
int gsl_integration_qaws (gsl_function* f, const double a, const double b, gsl_integration_qaws_table* t, const double epsabs, const double epsrel, const size_t limit, gsl_integration_workspace* workspace, double* result, double* abserr);
int gsl_integration_qawo (gsl_function* f, const double a, const double epsabs, const double epsrel, const size_t limit, gsl_integration_workspace* workspace, gsl_integration_qawo_table* wf, double* result, double* abserr);
int gsl_integration_qawf (gsl_function* f, const double a, const double epsabs, const size_t limit, gsl_integration_workspace* workspace, gsl_integration_workspace* cycle_workspace, gsl_integration_qawo_table* wf, double* result, double* abserr);
gsl_integration_glfixed_table* gsl_integration_glfixed_table_alloc (size_t n);
void gsl_integration_glfixed_table_free (gsl_integration_glfixed_table* t);
double gsl_integration_glfixed (const(gsl_function)* f, double a, double b, const(gsl_integration_glfixed_table)* t);
int gsl_integration_glfixed_point (double a, double b, size_t i, double* xi, double* wi, const(gsl_integration_glfixed_table)* t);
gsl_integration_cquad_workspace* gsl_integration_cquad_workspace_alloc (const size_t n);
void gsl_integration_cquad_workspace_free (gsl_integration_cquad_workspace* w);
int gsl_integration_cquad (const(gsl_function)* f, double a, double b, double epsabs, double epsrel, gsl_integration_cquad_workspace* ws, double* result, double* abserr, size_t* nevals);