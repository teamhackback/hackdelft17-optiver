/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.chebyshev;
import gsl.math;
import gsl.mode;

extern (C):

alias gsl_cheb_series_struct gsl_cheb_series;

struct gsl_cheb_series_struct
{
    double* c;
    size_t order;
    double a;
    double b;
    size_t order_sp;
    double* f;
}

gsl_cheb_series* gsl_cheb_alloc (const size_t order);
void gsl_cheb_free (gsl_cheb_series* cs);
int gsl_cheb_init (gsl_cheb_series* cs, const(gsl_function)* func, const double a, const double b);
size_t gsl_cheb_order (const(gsl_cheb_series)* cs);
size_t gsl_cheb_size (const(gsl_cheb_series)* cs);
double* gsl_cheb_coeffs (const(gsl_cheb_series)* cs);
double gsl_cheb_eval (const(gsl_cheb_series)* cs, const double x);
int gsl_cheb_eval_err (const(gsl_cheb_series)* cs, const double x, double* result, double* abserr);
double gsl_cheb_eval_n (const(gsl_cheb_series)* cs, const size_t order, const double x);
int gsl_cheb_eval_n_err (const(gsl_cheb_series)* cs, const size_t order, const double x, double* result, double* abserr);
double gsl_cheb_eval_mode (const(gsl_cheb_series)* cs, const double x, gsl_mode_t mode);
int gsl_cheb_eval_mode_e (const(gsl_cheb_series)* cs, const double x, gsl_mode_t mode, double* result, double* abserr);
int gsl_cheb_calc_deriv (gsl_cheb_series* deriv, const(gsl_cheb_series)* cs);
int gsl_cheb_calc_integ (gsl_cheb_series* integ, const(gsl_cheb_series)* cs);