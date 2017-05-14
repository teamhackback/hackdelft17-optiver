/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.poly;
//import core.stdc.complex;
import gsl.complex;

extern (C):

struct gsl_poly_complex_workspace
{
    size_t nc;
    double* matrix;
}

double gsl_poly_eval (const(double)* c, const int len, const double x);
gsl_complex gsl_poly_complex_eval (const(double)* c, const int len, const gsl_complex z);
gsl_complex gsl_complex_poly_complex_eval (const(gsl_complex)* c, const int len, const gsl_complex z);
int gsl_poly_eval_derivs (const(double)* c, const size_t lenc, const double x, double* res, const size_t lenres);
int gsl_poly_dd_init (double* dd, const(double)* x, const(double)* y, size_t size);
double gsl_poly_dd_eval (const(double)* dd, const(double)* xa, const size_t size, const double x);
int gsl_poly_dd_taylor (double* c, double xp, const(double)* dd, const(double)* x, size_t size, double* w);
int gsl_poly_dd_hermite_init (double* dd, double* z, const(double)* xa, const(double)* ya, const(double)* dya, const size_t size);
int gsl_poly_solve_quadratic (double a, double b, double c, double* x0, double* x1);
int gsl_poly_complex_solve_quadratic (double a, double b, double c, gsl_complex* z0, gsl_complex* z1);
int gsl_poly_solve_cubic (double a, double b, double c, double* x0, double* x1, double* x2);
int gsl_poly_complex_solve_cubic (double a, double b, double c, gsl_complex* z0, gsl_complex* z1, gsl_complex* z2);
gsl_poly_complex_workspace* gsl_poly_complex_workspace_alloc (size_t n);
void gsl_poly_complex_workspace_free (gsl_poly_complex_workspace* w);
int gsl_poly_complex_solve (const(double)* a, size_t n, gsl_poly_complex_workspace* w, gsl_complex_packed_ptr z);